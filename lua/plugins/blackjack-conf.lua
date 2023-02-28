return {
   'alanfortlink/blackjack.nvim',
   lazy = true,
   cmd = 'BlackJackNewGame',
   dependencies = { 'nvim-lua/plenary.nvim' },

   config = {
      card_style = 'mini',
      suit_style = 'black',
   }
}
