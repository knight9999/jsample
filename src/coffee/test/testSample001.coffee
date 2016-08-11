# define [], ()->

  describe 'Sample001 Test', ()->

    it '1 + 1 = 2', ()->
      expect( 2 ).toBe(2)
      return

    it '1 + 2 = 3', ()->
      expect( 3 ).toBe(3)
      return

    return
