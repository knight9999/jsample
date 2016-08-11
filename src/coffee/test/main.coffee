require.config

  # 絶対パスで設定すること
  baseUrl:
    '/'

  # ファイル読み込み待ち時間
  waitSeconds:
    120

  paths:
    jquery:                'lib/jquery-2.2.4'

    'callAjax01':          'js/callAjax01'

    # jasmine:              'lib/test/lib/jasmine-core/jasmine'
    # 'jasmine-html':        'lib/test/lib/jasmine-core/jasmine-html'
    # 'jasmine-boot':        'lib/test/lib/jasmine-core/boot'
    # 'jasmine-ajax':        'lib/test/lib/jasmine-ajax/mock-ajax'
    # 'jasmine-jquery':        'lib/test/lib/jasmine-jquery-1.3.1'

    jasmine:              'js/jasmine-core/lib/jasmine-core/jasmine'
    'jasmine-html':        'js/jasmine-core/lib/jasmine-core/jasmine-html'
    'jasmine-boot':       'js/jasmine-core/lib/jasmine-core/boot'
    'jasmine-ajax':       'js/jasmine-ajax/lib/mock-ajax'
    'jasmine-jquery':      'js/jasmine-jquery/lib/jasmine-jquery'


    'testSample001':        'js/test/testSample001'
    'testCallAjax01':        'js/test/testCallAjax01'

  shim:
    'jasmine-html':
      deps: ['jasmine']
    'jasmine-boot':
      deps: ['jasmine', 'jasmine-html']
    'jasmine-ajax':
      deps: ['jasmine', 'jasmine-html']
    'jasmine-jquery':
      deps: ['jasmine', 'jquery']

    'jquery':
      exports: '$'

# JSテストツールJasmineをCoffeeScriptで使う
#https://www.airpair.com/jasmine/posts/javascriptintegrating-jasmine-with-requirejs-amd
# 非同期
# http://jasmine.github.io/2.0/ajax.html
require( [ 'jasmine', 'jasmine-boot', 'jasmine-ajax' ], ()->
  require( [
    'jasmine-jquery' , 'jquery', 'testSample001','testCallAjax01'
  ], ()->
    jasmine.getFixtures().fixturesPath = '/js/test/fixtures'
    window.onload();
  )
)
