$(function() {
  function appendOption(category4) {
    let html = `<option value='${category4.id}' data-category4='${category4.id}'>${category4.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `
      <div id='children-wrapper'>
        <select id='children-category4' class='form-control' name='[children_id]'>
          <option value='---' data-category4='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category4-form').append(childrenSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML) {
    let grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `
      <div id='grandchildren-wrapper'>
        <select id='grandchildren-category4' class='form-control' name='[grandchildren_id]'>
          <option value='---' data-category4='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category4-form').append(grandchildrenSelectHtml);
  }

  $('#parent-category4').on('change', function() {
    let parentId = document.getElementById('parent-category4').value;
    if (parentId != '---') {
      $.ajax({
        url: '/get_category4/children',
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

  $('.category4-form').on('change', '#children-category4', function() {
    let childrenId = $('#children-category4 option:selected').data('category4');
    if (childrenId != '---') {
      $.ajax({
        url: '/get_category4/grandchildren',
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