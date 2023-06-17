require "csv"

memo_type = 0
until memo_type == 1 || memo_type == 2 do
  puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
  memo_type = gets.to_i
end

if memo_type == 1#新規でメモを作成
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp

  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl + Dで保存します"
  memo_content = STDIN.read

  CSV.open("#{file_name}.csv", "w") do |csv|
    csv << [memo_content]
  end

elsif memo_type == 2#既存のメモを編集
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp

  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl + Dで保存します"
  input_memo = CSV.read("#{file_name}.csv")
  puts input_memo
  memo_content = STDIN.read

  CSV.open("#{file_name}.csv", "a") do |csv|
    csv << [memo_content]
  end

end