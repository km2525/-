require 'csv'

def show_menu
  puts "メモアプリ（CSV版）"
  puts "1. 新規ファイルを作成"
  puts "2. 既存ファイルを編集"
  print "番号を入力してください（1 または 2）: "
end

def create_new_file
  print "作成するファイル名を入力してください（例：memo.csv）: "
  filename = gets.chomp

  CSV.open(filename, "w") do |csv|
    puts "メモを入力してください。終了するにはCtrl + D（Mac）または Ctrl + Z（Windows）を押します。"
    while line = gets
      csv << [line.chomp]
    end
  end

  puts "#{filename} を作成しました！"
end

def edit_existing_file
  print "編集するファイル名を入力してください（例：memo.csv）: "
  filename = gets.chomp

  if !File.exist?(filename)
    puts "ファイルが存在しません。"
    return
  end

  CSV.open(filename, "a") do |csv|
    puts "追記するメモを入力してください。終了するにはCtrl + D（Mac）または Ctrl + Z（Windows）を押します。"
    while line = gets
      csv << [line.chomp]
    end
  end

  puts "#{filename} に追記しました！"
end

# --- メイン処理 ---
loop do
  show_menu
  input = gets.chomp

  case input
  when "1"
    create_new_file
    break
  when "2"
    edit_existing_file
    break
  else
    puts "不正な値です。1か2を入力してください。"
  end
end
