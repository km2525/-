def janken
  hands = ["グー", "チョキ", "パー"]
  puts "じゃんけん..."
  puts "0: グー\n1: チョキ\n2: パー"

  print "あなたの手を選んでください(0〜2): "
  player_hand = gets.to_i

  # 入力チェック
  unless (0..2).include?(player_hand)
    puts "不正な値です。0〜2の数字を入力してください。"
    return :retry
  end

  computer_hand = rand(3)

  puts "あなた: #{hands[player_hand]} vs 相手: #{hands[computer_hand]}"

  if player_hand == computer_hand
    puts "あいこです。もう一度！"
    return :draw
  elsif (player_hand == 0 && computer_hand == 1) ||
        (player_hand == 1 && computer_hand == 2) ||
        (player_hand == 2 && computer_hand == 0)
    puts "あなたの勝ち！"
    return :player_win
  else
    puts "相手の勝ち！"
    return :computer_win
  end
end

def acchi_muite_hoi(winner)
  directions = ["上", "下", "左", "右"]

  puts "\nあっち向いて〜ホイ！"
  puts "0: 上\n1: 下\n2: 左\n3: 右"

  if winner == :player
    print "指を差す方向を選んでください(0〜3): "
    player_direction = gets.to_i
    unless (0..3).include?(player_direction)
      puts "不正な値です。0〜3の数字を入力してください。"
      return :retry
    end
    computer_direction = rand(4)
    puts "あなた: #{directions[player_direction]} ←→ 相手: #{directions[computer_direction]}"
    if player_direction == computer_direction
      puts "🎉 あなたの勝ち！ゲーム終了 🎉"
      return :end
    else
      puts "外れました。再戦！"
      return :continue
    end

  elsif winner == :computer
    print "顔を向ける方向を選んでください(0〜3): "
    player_direction = gets.to_i
    unless (0..3).include?(player_direction)
      puts "不正な値です。0〜3の数字を入力してください。"
      return :retry
    end
    computer_direction = rand(4)
    puts "あなた: #{directions[player_direction]} ←→ 相手: #{directions[computer_direction]}"
    if player_direction == computer_direction
      puts "😵 相手の勝ち！ゲーム終了 😵"
      return :end
    else
      puts "セーフ！再戦！"
      return :continue
    end
  end
end

# メイン処理ループ
loop do
  result = janken

  case result
  when :retry
    next
  when :draw
    next
  when :player_win
    loop do
      res = acchi_muite_hoi(:player)
      break if res == :end
      next if res == :retry
      break if res == :continue
    end
  when :computer_win
    loop do
      res = acchi_muite_hoi(:computer)
      break if res == :end
      next if res == :retry
      break if res == :continue
    end
  end
end
