module Acronym
  def self.abbreviate(phrase)
    phrase.split(/[\s-]/)
      .map{ |word| word.gsub(/[^a-z0-9]/i, "").slice(0) }
      .join
      .upcase
  end
end
