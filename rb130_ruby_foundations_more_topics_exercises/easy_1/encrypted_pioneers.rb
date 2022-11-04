LOWERCASE_ALPHABET = ('a'..'z').to_a.freeze
UPPERCASE_ALPHABET = ('A'..'Z').to_a.freeze

def rot13(name)
  name.chars.inject('') do |result, letter|
    result + decipher_letter(letter)
  end
end

def decipher_letter(letter)
  if LOWERCASE_ALPHABET.include?(letter)
    LOWERCASE_ALPHABET[LOWERCASE_ALPHABET.index(letter) - 13]
  elsif UPPERCASE_ALPHABET.include?(letter)
    UPPERCASE_ALPHABET[UPPERCASE_ALPHABET.index(letter) - 13]
  else
    letter
  end
end

p rot13('Nqn Ybirynpr')
p rot13('Tenpr Ubccre')
p rot13('Nqryr Tbyqfgvar')
p rot13('Nyna Ghevat')
p rot13('Puneyrf Onoontr')
p rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p rot13('Wbua Ngnanfbss')
p rot13('Ybvf Unvog')
p rot13('Pynhqr Funaaba')
p rot13('Fgrir Wbof')
p rot13('Ovyy Tngrf')
p rot13('Gvz Orearef-Yrr')
p rot13('Fgrir Jbmavnx')
p rot13('Xbaenq Mhfr')
p rot13('Fve Nagbal Ubner')
p rot13('Zneiva Zvafxl')
p rot13('Lhxvuveb Zngfhzbgb')
p rot13('Unllvz Fybavzfxv')
p rot13('Tregehqr Oynapu')
