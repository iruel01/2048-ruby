#!/usr/local/bin/ruby
# Ruby and curses version of the popular 2048 Game
# copyright 2014 Alice under the GNU GPL
# this code is public
# inspired by the 2048 Game, Wade's 2048 in C, and my desire to learn ruby

require "curses"
include Curses

#define Tile_num as their own class
class Tile_num

	value = 0
	location_x = 0
	location_y = 0

	def initialize
		value = 0
		location_x = 0
		location_y = 0
	end

	def check_location
		return [location_x, location_y]
	end

	def check_value
		return value
	end

	def set_location(x, y)
		location_x = x
		location_y = y
	end

	def set_value(new_value)
		value = new_value
	end

end

#define the grid of tiles
class Board_tiles
	@boardgrid

	def self.boardgrid
		@boardgrid
	end

	def initialize
		@boardgrid = Array.new(4, Tile_num.new) {Array.new(4, Tile_num.new)}
		srand

		temp_loc_x = rand(1..4)
		temp_loc_y = rand(1..4)

		for i in 0..1
			@boardgrid[temp_loc_y][temp_loc_x].set_location(temp_loc_x, temp_loc_y)
			@boardgrid[temp_loc_y][temp_loc_x].set_value(2*rand(1..(i + 1)))
		end

	end

	def move_left()

	end

	def move_right()

	end

	def move_up()

	end

	def move_down()

	end

	def get_Board_tiles
		return boardgrid
	end

end

#define the board and use Curses to display it
class Game_Curses_Board < Board_tiles

	win = Window.new(7, 7, (lines - 7) / 2, (cols - 7) / 2)
	setpos((lines - 7) / 2, (cols - 7) / 2)

	def Game #play the Game_Curses_Board
		input_key = 'y'
		while(input_key != 'q')
			for i in 1..4
				addstr(create_list(i))
			end
			input_key = getch
		end

	end

	def create_list(line_index) #build list for the Tile_num
		for i in (1..7)
			list = ""
			if(i % 2 == 1)
				list += boardgrid[line_index][i].to_s
			else
				list += ' '
			end
		end

		return list
	end

end

def main

	play_2048_game = Game_Curses_Board.new
	play_2048_game.Game

end

main