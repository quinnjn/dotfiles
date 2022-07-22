let index = 0;

const incrementAssignee = (direction) => {
  clickAssignee();

  if (direction === -1 && index > 0) {
    index--;
  } 
  else if (direction === 1 && index < document.querySelectorAll('.ghx-expander').length -1) {
    index++;
  }

  console.log(index);

  clickAssignee();
};

const clickAssignee = () => {
  const assignee = document.querySelectorAll('.ghx-expander')[index];
  assignee.click();
  debugger;
  assignee.parentElement.parentElement.querySelector('.ghx-wrap-issue').scrollIntoView(true);
  window.scrollBy(0, -100);
};

const closeAll = () => 
  [...document.querySelectorAll('.ghx-swimlane')].forEach(el => {
    if (!el.classList.contains('ghx-closed')) {
      el.querySelector('.ghx-expander').click();
    }
  });

document.addEventListener('keypress', (ev) => {
    ev.preventDefault();
  if (ev.code === 'KeyJ') {
    incrementAssignee(1);
  } else if (ev.code === 'KeyK') {
    ev.preventDefault();
    incrementAssignee(-1);
  } else if (ev.code === 'Equal') {
    ev.preventDefault();
    closeAll();
    index = 0;
    clickAssignee();

    const title = document.querySelector('.subnavigator-title')
    if (title.innerHTML.indexOf('Stand Up') === -1) {
      title.innerHTML += ' [Stand Up!]';
    }
  }
});

