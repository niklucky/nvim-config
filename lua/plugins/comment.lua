-- "gc" to comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  lazy = false,
  config = function ()
    require('Comment').setup()
  end
}
