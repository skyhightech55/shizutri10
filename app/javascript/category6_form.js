$(function() {
  function appendOption(category6) {
    let html = `<option value='${category6.id}' data-category6='${category6.id}'>${category6.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `
      <div id='children-wrapper'>
        <select id='children-category6' class='form-control' name='[children_id]'>
          <option value='---' data-category6='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category6-form').append(childrenSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML) {
    let grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `
      <div id='grandchildren-wrapper'>
        <select id='grandchildren-category5' class='form-control' name='[grandchildren_id]'>
          <option value='---' data-category5='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category6-form').append(grandchildrenSelectHtml);
  }

  $('#parent-category6').on('change', function() {
    let parentId = document.getElementById('parent-category6').value;
    if (parentId != '---') {
      $.ajax({
        url: '/get_category6/children',
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

  $('.category6-form').on('change', '#children-category6', function() {
    let childrenId = $('#children-category6 option:selected').data('category6');
    if (childrenId != '---') {
      $.ajax({
        url: '/get_category6/grandchildren',
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