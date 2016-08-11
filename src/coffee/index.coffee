require.config

	# 絶対パスで設定すること
	baseUrl:
		'/'

	# ファイル読み込み待ち時間
	waitSeconds:
		120

	paths:
		jquery:								'lib/jquery-2.2.4'

		'callAjax01':				'js/callAjax01'

	shim:
		'jquery':
			exports: '$'

require( [ 'jquery' , 'callAjax01' ] , (jquery,callAjax01) ->
  window.callAjax01 = callAjax01
)
