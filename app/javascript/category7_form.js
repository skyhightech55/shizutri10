$(function() {
  function appendOption(category7) {
    let html = `<option value='${category7.id}' data-category7='${category7.id}'>${category7.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `
      <div id='children-wrapper'>
        <select id='children-category7' class='form-control' name='[children_id]'>
          <option value='---' data-category7='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category7-form').append(childrenSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML) {
    let grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `
      <div id='grandchildren-wrapper'>
        <select id='grandchildren-category7' class='form-control' name='[grandchildren_id]'>
          <option value='---' data-category7='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category7-form').append(grandchildrenSelectHtml);
  }

  $('#parent-category7').on('change', function() {
    let parentId = document.getElementById('parent-category7').value;
    if (parentId != '---') {
      $.ajax({
        url: '/get_category7/children',
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

  $('.category7-form').on('change', '#children-category6', function() {
    let childrenId = $('#children-category7 option:selected').data('category7');
    if (childrenId != '---') {
      $.ajax({
        url: '/get_category7/grandchildren',
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