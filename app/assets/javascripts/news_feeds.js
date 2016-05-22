var NewsFeed = function (selectors) {
  this.addCommentButtons = selectors.addCommentButtons;
  this.commentForm = selectors.commentForm;
};

NewsFeed.prototype.bindEvents = function () {
  this.addCommentButtonsHandler();
};

NewsFeed.prototype.addCommentButtonsHandler = function () {
  var _this = this;
  this.addCommentButtons.on('click', function(e) {
    e.preventDefault();
    _this.openCommentForm($(this));
  });
};

NewsFeed.prototype.openCommentForm = function (link) {
  var containerUl = link.closest('[data-container="' + link.data('addTo') + '"]').find('ul:first');
  var form = this.commentForm.clone();
  form.find('input[name="commentable_type"]').val(link.data('commentableType'));
  form.find('input[name="commentable_id"]').val(link.data('commentableId'));
  form.find('input[name="anchor_value"]').val(link.data('anchor'));
  form.insertAfter(containerUl);
};


$(function () {
  var selectors = {
    addCommentButtons: $('.add_comment'),
    commentForm: $('.comment_form'),
  };

  (new NewsFeed(selectors)).bindEvents();
});

