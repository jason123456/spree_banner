$.fn.promotionAutocomplete = function () {
  'use strict';

  this.select2({
    minimumInputLength: 1,
    multiple: false,
    initSelection: function (element, callback) {
      $.get(Spree.routes.promotion_search, {
        ids: element.val(), 
        per_page: 200 
      }, function (data) {
        callback(data);
      });
    },
    ajax: {
      url: Spree.routes.promotion_search,
      datatype: 'json',
      data: function (term, page) {
        return {
          q: {
            name_cont: term
          },
          per_page: 200 
        };
      },
      results: function (data, page) {
        var promotions = data ? data : [];
        return {
          results: promotions
        };
      }
    },
    id: function (item) { 
    	return item.promotion.id; 
	},
    formatResult: function (item) {
      return item.promotion.name;
    },
    formatSelection: function (item) {
      return item.promotion.name;
    }
  });
};

$(document).ready(function () {
  $('.promotion_picker').promotionAutocomplete();
});