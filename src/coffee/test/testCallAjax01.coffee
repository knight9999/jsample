define ['callAjax01'], (callAjax01)->

  describe 'callAjax01 with real HTML DOM Test', ()->

    beforeEach ()->
      $('body').append('<div id="result">xxx</div>')
      jasmine.Ajax.install()

    afterEach ()->
      jasmine.Ajax.uninstall()
      $('#result').remove()

    describe '毎回レスポンスを指定して返すサンプル', ()->
      onSuccess = null
      onFailure = null
      request = null

      beforeEach (done)->
        onSuccess = jasmine.createSpy('onSuccess')
        onFailure = jasmine.createSpy('onFailure')
        callAjax01( onSuccess, onFailure )
        request = jasmine.Ajax.requests.mostRecent()
        request.respondWith( {
          status: 200,
          responseText: '{ "key": "value-mock01" }'
        } )
        done()

      it 'called?', ()->
        expect( onSuccess).toHaveBeenCalled();
#      expect( onFailure).toHaveBeenCalled();
#      expect( $('#result').html() ).toBe('success')
        return

      it 'value is OK?', ()->
        expect( $('#result').html() ).toBe('Success:{"key":"value-mock01"}')
        return

    describe '予め指定されたレスポンスを返すサンプル', ()->
      onSuccess = null
      onFailure = null
      request = null

      beforeEach (done)->
        data 		= JSON.stringify( "key":"value-mock02" )
        response 	= { "status": 200, "contentType": 'text/json', "responseText": data }
        jasmine.Ajax.stubRequest( '/api/ajax01.json' ).andReturn( response )
        onSuccess = jasmine.createSpy('onSuccess')
        onFailure = jasmine.createSpy('onFailure')
        callAjax01( onSuccess, onFailure )
        done()

      it 'called?', ()->
        expect( onSuccess).toHaveBeenCalled();
#      expect( onFailure).toHaveBeenCalled();
#      expect( $('#result').html() ).toBe('success')
        return

      it 'value is OK?', ()->
        expect( $('#result').html() ).toBe('Success:{"key":"value-mock02"}')
        return

    return


  describe 'callAjax01 with fixture HTML Test', ()->

    beforeEach ()->
      jasmine.getFixtures().fixturesPath = '/js/test/fixtures'
      loadFixtures('dummy.html')
      jasmine.Ajax.install()

    afterEach ()->
      jasmine.Ajax.uninstall()

    describe '毎回レスポンスを指定して返すサンプル', ()->
      onSuccess = null
      onFailure = null
      request = null

      beforeEach (done)->
        onSuccess = jasmine.createSpy('onSuccess')
        onFailure = jasmine.createSpy('onFailure')
        callAjax01( onSuccess, onFailure )
        request = jasmine.Ajax.requests.mostRecent()
        request.respondWith( {
          status: 200,
          responseText: '{ "key": "value-mock01" }'
        } )
        done()

      it 'called?', ()->
        expect( onSuccess).toHaveBeenCalled();
#      expect( onFailure).toHaveBeenCalled();
#      expect( $('#result').html() ).toBe('success')
        return

      it 'value is OK?', ()->
        expect( $('#result').html() ).toBe('Success:{"key":"value-mock01"}')
        return

    describe '予め指定されたレスポンスを返すサンプル', ()->
      onSuccess = null
      onFailure = null
      request = null

      beforeEach (done)->
        data 		= JSON.stringify( "key":"value-mock02" )
        response 	= { "status": 200, "contentType": 'text/json', "responseText": data }
        jasmine.Ajax.stubRequest( '/api/ajax01.json' ).andReturn( response )
        onSuccess = jasmine.createSpy('onSuccess')
        onFailure = jasmine.createSpy('onFailure')
        callAjax01( onSuccess, onFailure )
        done()

      it 'called?', ()->
        expect( onSuccess).toHaveBeenCalled();
#      expect( onFailure).toHaveBeenCalled();
#      expect( $('#result').html() ).toBe('success')
        return

      it 'value is OK?', ()->
        expect( $('#result').html() ).toBe('Success:{"key":"value-mock02"}')
        return

    return
