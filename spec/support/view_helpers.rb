require 'htmlentities'

module ViewHelpers
  def decode(string='')
    coder = HTMLEntities.new
    coder.decode(string)
  end
end
