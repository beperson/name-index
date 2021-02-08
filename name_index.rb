class NameIndex
  CHARS = {
    'ア' => ['ア', 'イ', 'ウ', 'エ', 'オ'],
    'カ' => ['カ', 'キ', 'ク', 'ケ', 'コ', 'ガ', 'ギ', 'グ', 'ゲ', 'ゴ'],
    'サ' => ['サ', 'シ', 'ス', 'セ', 'ソ', 'ザ', 'ジ', 'ズ', 'ゼ', 'ゾ'],
    'タ' => ['タ', 'チ', 'ツ', 'テ', 'ト', 'ダ', 'ヂ', 'ヅ', 'デ', 'ド'],
    'ナ' => ['ナ', 'ニ', 'ヌ', 'ネ', 'ノ'],
    'ハ' => ['ハ', 'ヒ', 'フ', 'ヘ', 'ホ', 'バ', 'ビ', 'ブ', 'ベ', 'ボ', 'パ', 'ピ', 'プ', 'ペ', 'ポ'],
    'マ' => ['マ', 'ミ', 'ム', 'メ', 'モ'],
    'ヤ' => ['ヤ', 'ユ', 'ヨ'],
    'ラ' => ['ラ', 'リ', 'ル', 'レ', 'ロ'],
    'ワ' => ['ワ', 'ヲ']
  }.to_a

  def self.create_index(names)
    buffer = names.inject({}) do |result_hash, name|
      CHARS.each do |first_char, line_chars|
        next unless line_chars.include?(name[0])
        if result_hash.has_key?(first_char)
          result_hash[first_char].push(name)
        else
          result_hash[first_char] = [name]
        end
        break result_hash
      end
    end
    buffer.each { |line| line[1].sort!}
    buffer.to_a.sort! { |a, b| a[0] <=> b[0] }
  end
end