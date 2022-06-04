$(function() {
  function appendOption(category5) {
    let html = `<option value='${category5.id}' data-category5='${category5.id}'>${category5.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `
      <div id='children-wrapper'>
        <select id='children-category5' class='form-control' name='[children_id]'>
          <option value='---' data-category5='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category5-form').append(childrenSelectHtml);
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
    $('.category5-form').append(grandchildrenSelectHtml);
  }

  $('#parent-category5').on('change', function() {
    let parentId = document.getElementById('parent-category5').value;
    if (parentId != '---') {
      $.ajax({
        url: '/get_category5/children',
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

  $('.category5-form').on('change', '#children-category5', function() {
    let childrenId = $('#children-category5 option:selected').data('category5');
    if (childrenId != '---') {
      $.ajax({
        url: '/get_category5/grandchildren',
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