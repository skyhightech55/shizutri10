function post (){
  console.log("イベント発火");
};

window.addEventListener('load', post);

$(function() {
  function appendOption(category2) {
    let html = `<option value='${category2.id}' data-category2='${category2.id}'>${category2.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `
      <div id='children-wrapper'>
        <select id='children-category2' class='form-control' name='[children_id]'>
          <option value='---' data-category2='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category2-form').append(childrenSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML) {
    let grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `
      <div id='grandchildren-wrapper'>
        <select id='grandchildren-category2' class='form-control' name='[grandchildren_id]'>
          <option value='---' data-category2='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category2-form').append(grandchildrenSelectHtml);
  }

  $('#parent-category2').on('change', function() {
    let parentId = document.getElementById('parent-category2').value;
    if (parentId != '---') {
      $.ajax({
        url: '/get_category2/children',
        type: 'GET',
        data: {
          parent_id: parentId,
        },
        dataType: 'json',
      })
        .done(function(children) {
          $('#children-wrapper').remove();
          $('#grandchildren-wrapper').remove();
          let insertHTML = '';
          children.forEach(function(children) {
            insertHTML += appendOption(children);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function() {
          alert('ジャンル取得に失敗しました');
        });
    } else {
      $('#children-wrapper').remove();
      $('#grandchildren-wrapper').remove();
    }
  });

  $('.category2-form').on('change', '#children-category2', function() {
    let childrenId = $('#children-category2 option:selected').data('category2');
    if (childrenId != '---') {
      $.ajax({
        url: '/get_category2/grandchildren',
        type: 'GET',
        data: {
          children_id: childrenId,
        },
        dataType: 'json',
      })
        .done(function(grandchildren) {
          if (grandchildren.length != 0) {
            $('#grandchildren-wrapper').remove();
            let insertHTML = '';
            grandchildren.forEach(function(grandchildren) {
              insertHTML += appendOption(grandchildren);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function() {
          alert('ジャンル取得に失敗しました');
        });
    } else {
      $('#grandchildren-wrapper').remove();
    }
  });
});