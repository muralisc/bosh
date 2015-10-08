module Bosh::Director
  class Canonicalizer
    def self.canonicalize(string)
      # a-z, 0-9, -, case insensitive, and must start with a letter
      string = string.downcase.gsub(/_/, "-").gsub(/[^a-z0-9-]/, "")
      if string =~ /^(\d|-)/
        raise DnsInvalidCanonicalName,
          "Invalid DNS canonical name `#{string}', must begin with a letter"
      end
      if string =~ /-$/
        raise DnsInvalidCanonicalName,
          "Invalid DNS canonical name `#{string}', can't end with a hyphen"
      end
      string
    end
  end
end
