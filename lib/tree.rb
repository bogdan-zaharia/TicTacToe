class Tree
  def self.to_tree(board, player)
    tree = []
    board.each_with_index do |cell, i|
      next_child = []
      if cell == ' '
        temp_board = board.dup
        player ? temp_board[i] = 'X' : temp_board[i] = 'O'
        if player_win?(temp_board) == true
          score = -10
        elsif ai_win?(temp_board) == true
          score = 10
        else
          next_child = to_tree(temp_board,!player)
          score = 0
        end
        tree << { position: i, children: next_child, score: score }
      end
    end
    tree
  end

  def self.player_win?(board)
    @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @winning_combinations.each do |i|
      if (board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]] && board[i[2]] == 'X')
        return true
      end
    end
    return false
  end

  def self.ai_win?(board)
    @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @winning_combinations.each do |i|
      if (board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]] && board[i[2]] == 'O')
        return true
      end
    end
    return false
  end

  def self.draw?(board)
    if player_win? == false && ai_win? == false && board_full? == true
      return true
    end
    return false
  end

  def self.board_full?(board)
    board.each do |cell|
      if (cell == ' ')
        return false
      end
    end
    return true
  end

  def self.game_end?(board)
    if ai_win? == false && player_win? == false && board_full? == true
      return true
    end
    return false
  end
end
