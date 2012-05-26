class Clipboard
  attr_accessor :commands, :last_commands

  def initialize
    @commands = []
    @last_commands = []
  end

  def undo
    @last_commands << @commands.pop
    self
  end

  def redo
    @commands << @last_commands.pop
    self
  end
end
