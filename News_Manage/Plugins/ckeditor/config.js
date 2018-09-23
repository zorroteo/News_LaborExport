/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:?
    config.language = 'vi';
    config.skin = 'moono'; //moono,moonocolor,office2013
    config.extraPlugins = 'quicktable,youtube,tableresize';
    config.filebrowserBrowseUrl = '~/Plugins/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '~/Plugins/ckfinder/ckfinder.html?type=Images';
    config.filebrowserFlashBrowseUrl = '~/Plugins/ckfinder/ckfinder.html?type=Flash';
    config.filebrowserUploadUrl = '~/Plugins/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '~/Plugins/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';
    config.filebrowserFlashUploadUrl = '~/Plugins/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';
    //// config.uiColor = '#AADC6E';
};
