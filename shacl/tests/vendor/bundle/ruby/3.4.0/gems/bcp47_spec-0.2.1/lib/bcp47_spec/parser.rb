# frozen_string_literal: true

module BCP47
  module Parser
    # https://tools.ietf.org/html/bcp47#section-2.1
    # Augmented BNF for Syntax Specifications: https://tools.ietf.org/html/rfc5234

    # Language-Tag  = langtag             ; normal language tags
    #               / privateuse          ; private use tag
    #               / grandfathered       ; grandfathered tags

    # langtag       = language
    #                 ["-" script]
    #                 ["-" region]
    #                 *("-" variant)
    #                 *("-" extension)
    #                 ["-" privateuse]

    # language      = 2*3ALPHA            ; shortest ISO 639 code
    #                 ["-" extlang]       ; sometimes followed by
    #                                     ; extended language subtags
    #               / 4ALPHA              ; or reserved for future use
    #               / 5*8ALPHA            ; or registered language subtag

    # extlang       = 3ALPHA              ; selected ISO 639 codes
    #                 *2("-" 3ALPHA)      ; permanently reserved

    # script        = 4ALPHA              ; ISO 15924 code

    # region        = 2ALPHA              ; ISO 3166-1 code
    #               / 3DIGIT              ; UN M.49 code

    # variant       = 5*8alphanum         ; registered variants
    #               / (DIGIT 3alphanum)

    # extension     = singleton 1*("-" (2*8alphanum))

    #                                     ; Single alphanumerics
    #                                     ; "x" reserved for private use
    # singleton     = DIGIT               ; 0 - 9
    #               / %x41-57             ; A - W
    #               / %x59-5A             ; Y - Z
    #               / %x61-77             ; a - w
    #               / %x79-7A             ; y - z

    # privateuse    = "x" 1*("-" (1*8alphanum))

    # grandfathered = irregular           ; non-redundant tags registered
    #               / regular             ; during the RFC 3066 era

    # irregular     = "en-GB-oed"         ; irregular tags do not match
    #               / "i-ami"             ; the 'langtag' production and
    #               / "i-bnn"             ; would not otherwise be
    #               / "i-default"         ; considered 'well-formed'
    #               / "i-enochian"        ; These tags are all valid,
    #               / "i-hak"             ; but most are deprecated
    #               / "i-klingon"         ; in favor of more modern
    #               / "i-lux"             ; subtags or subtag
    #               / "i-mingo"           ; combination
    #               / "i-navajo"
    #               / "i-pwn"
    #               / "i-tao"
    #               / "i-tay"
    #               / "i-tsu"
    #               / "sgn-BE-FR"
    #               / "sgn-BE-NL"
    #               / "sgn-CH-DE"

    # regular       = "art-lojban"        ; these tags match the 'langtag'
    #               / "cel-gaulish"       ; production, but their subtags
    #               / "no-bok"            ; are not extended language
    #               / "no-nyn"            ; or variant subtags: their meaning
    #               / "zh-guoyu"          ; is defined by their registration
    #               / "zh-hakka"          ; and all of these are deprecated
    #               / "zh-min"            ; in favor of a more modern
    #               / "zh-min-nan"        ; subtag or sequence of subtags
    #               / "zh-xiang"

    # alphanum      = (ALPHA / DIGIT)     ; letters and numbers

    # Simplified check. Not implementing high level privateuse / grandfathered.
    # Should replace with a proper check at some point.
    ALPHANUM = /[a-zA-Z\d]/
    SINGLETON = /[\dA-WY-Za-wy-z]/

    EXTLANG = /[a-zA-Z]{3}(-[a-zA-Z]{3}){0,2}/

    LANGUAGE   = /([a-zA-Z]{2,3}(-#{EXTLANG})?|[a-zA-Z]{4}|[a-zA-Z]{5,8})/
    SCRIPT     = /[a-zA-Z]{4}/
    REGION     = /([a-zA-Z]{2}|\d{3})/
    VARIANT    = /(#{ALPHANUM}{5,8}|\d#{ALPHANUM}{3})/
    EXTENSION  = /#{SINGLETON}(-[a-zA-Z]{2,8})+/
    PRIVATEUSE = /x(-#{ALPHANUM}{1,8})+/

    # Ruby .match only keeps the first captured group, so expressions like variants/extensions we need to keep everything
    # in one captured group, then break them down in multipe groups separately
    LANGTAG = %r{
      (?<language>#{LANGUAGE})
      (-(?<script>#{SCRIPT}))?
      (-(?<region>#{REGION}))?
      (?<variants>(-#{VARIANT})*)
      (?<extensions>(-#{EXTENSION})*)
      (-(?<private>#{PRIVATEUSE}))?
    }x

    LANGUAGE_TAG = /\A#{LANGTAG}\z/

    class << self
      def parse(language_tag)
        return unless match = language_tag.match(LANGUAGE_TAG)

        named_captures(match).tap do |captures|
          captures['variants']   = captures['variants'].to_s.empty? ? [] : captures['variants'][/-(.*)/, 1].split('-').sort
          captures['extensions'] = split_extensions(captures['extensions'])
          captures['private']    = captures['private'].to_s.empty? ? [] : captures['private'][/x-(.*)/, 1].split('-').sort
        end
      end

      private

      def named_captures(match)
        return match.named_captures if match.respond_to?(:named_captures)

        match.names.each_with_object({}) { |name, acc| acc[name] = match[name] }
      end

      def split_extensions(extensions)
        return [] if extensions.to_s.empty?

        # [["u-attr-co-phonebk"], ["t-und-cyrl"]]
        extensions = extensions.scan(/\b(?<ext>#{EXTENSION})\b/)
        # [["t", "und-cyrl"], ["u", "attr-co-phonebk"]]
        extensions.flatten.sort.map { |st| st.split('-', 2) }
      end
    end
  end
end
