// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require jquery_ujs
import "@hotwired/turbo-rails";
import "controllers"; 


import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    this.element.addEventListener("submit", clear);
  }

  clear() {
    this.element.reset()
  }
}

CKEDITOR.editorConfig = function(config) {
  config.language = 'en';
  config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";
  config.toolbar_Pure = [
    '/', {
      name: 'basicstyles',
      items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
    }, {
      name: 'paragraph',
      items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']
    }, {
      name: 'links',
      items: ['Link', 'Unlink']
    }, '/', {
      name: 'styles',
      items: ['Styles', 'Format', 'Font', 'FontSize']
    }, {
      name: 'colors',
      items: ['TextColor', 'BGColor']
    }, {
      name: 'insert',
      items: ['Image', 'Table', 'HorizontalRule', 'PageBreak']
    }
  ];
  config.toolbar = 'Pure';
  return true;
};


const messages = document.getElementById('messages');

function appendMessage() {
	const message = document.getElementsByClassName('message')[0];
  const newMessage = message.cloneNode(true);
  messages.appendChild(newMessage);
}

function getMessages() {
	// Prior to getting your messages.
  container.scrollTop + container.clientHeight >= container.scrollHeight
  shouldScroll = messages.scrollTop + messages.clientHeight === messages.scrollHeight;

  /*
   * Get your messages, we'll just simulate it by appending a new one syncronously.
   */
  appendMessage();
  // After getting your messages.
  if (!shouldScroll) {
    scrollToBottom();
  }
}

function scrollToBottom() {
  messages.scrollTop = messages.scrollHeight;
}

scrollToBottom();

setInterval(getMessages, 100);
