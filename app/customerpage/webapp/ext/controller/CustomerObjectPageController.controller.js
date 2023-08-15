sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('customerpage.ext.controller.CustomerObjectPageController', {

		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		customRichTextDivId: 'custemRichTextDiv',
		createCustomRichTextDiv: function(value) {
			return `<div id='${this.customRichTextDivId}'>${value}</div`
		},
		customRichTextId: 'textarea[id*=customRichText]',
		richTextClass: '.richText',
		richTextConfig: {
			bold: true,
            italic: true,
            underline: true,
            leftAlign: true,
            centerAlign: true,
            rightAlign: true,
            justify: true,
            ol: true,
            ul: true,
            heading: false,
            fonts: true,
            fontColor: true,
            backgroundColor: false,
            fontSize: false,
            imageUpload: false,
            fileUpload: false,
            videoEmbed: false,
            urls: false,
            table: true,
            removeStyles: true,
            code: true,
            fileHTML: '',
            imageHTML: '',
            youtubeCookies: false,
            preview: false,
            placeholder: '',
            useSingleQuotes: false,
            height: 0,
            heightPercentage: 0,
            adaptiveHeight: false,
            id: "",
            class: "",
            useParagraph: false,
            maxlength: 0,
            maxlengthIncludeHTML: false,
            callback: undefined,
            useTabForNext: false,
            save: false,
            saveCallback: undefined,
            saveOnBlur: 0,
            undoRedo: false
		},
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf customerpage.ext.controller.CustomerObjectPageController
             */
			onInit: function () {
				console.log('onInit')
				var that = this
				$(document).ready(()=> {
					$('<link/>', {
						rel: 'stylesheet',
						type: 'text/css',
						href: 'https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'
					}).appendTo('head');

					MutationObserver = window.MutationObserver || window.WebKitMutationObserver;
                    var observer = new MutationObserver(function(mutations, observer) {
                        // fired when a mutation occurs
                        console.log(mutations, observer);
                        console.log('===================')
                        console.log('customRichText', $(that.customRichTextId))
						console.log('edit mode', that.base.getModel('ui').oData.editMode)

                    });
                    // define what element should be observed by the observer
                    // and what types of mutations trigger the callback
                    observer.observe($('.sapUxAPBlockContainer')[0], {
                        subtree: true,
                        attributes: true
                    });




				});
			},
			onBeforeRendering: function() {
				console.log('onBeforeRendering')
			},
			onAfterRendering: function() {
				console.log('onAfterRendering')
				console.log('this', this.base.getModel('ui').oData.editMode)
				console.log('control', $(this.customRichTextId))
			},
			onExit: function() {
				console.log('onExit')
			},
			editFlow: {
				
				onBeforeEdit: function (mParameters) {
					console.log('onBeforeEdit')
					//https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js
					$(this.customRichTextId).richText(
						this.richTextConfig
					)
					$(this.richTextClass).parent().parent().prop('class', '')
				},
				onBeforeSave: function (mParameters) {
					console.log('onBeforeSave')
				},
				onBeforeDiscard: function (mParameters) {
					console.log('onBeforeDiscard')
				},
				onBeforeCreate: function (mParameters) {
					console.log('onBeforeCreate')
				},
				onBeforeDelete: function (mParameters) {
					console.log('onBeforeDelete')
				},
				onAfterSave: function (mParameters) {
					console.log('onAfterSave')
					// remove rich text 
					$(this.richTextClass).replaceWith($(this.customRichTextId))
					// set visibale for text area
					$(this.customRichTextId).prop('style', '')
				},
				onAfterEdit: function (mParameters) {
					console.log('onAfterEdit')
					
				},
				onAfterDiscard: function (mParameters) {
					console.log('onAfterDiscard')
					
				},
				onAfterCreate: function (mParameters) {
					console.log('onAfterCreate')
				},
				onAfterDelete: function (mParameters) {
					console.log('onAfterDelete')
				}
				
			}

		}
	});
});
