let pointer = 0;

/**
 * Moves the pointer to another assignee.
 *
 * @param {number} direction  - +1 increments the assignee, -1 decrements the assignee
 */
const incrementAssignee = (direction) => {
  clickAssignee();

  if (direction === -1 && pointer > 0) {
    pointer--;
  } 
  else if (direction === 1 && pointer < document.querySelectorAll('.ghx-expander').length -1) {
    pointer++;
  }

  clickAssignee();
};

/**
 * Clicks the assignee swimlane, causing it to open or close
 */
const clickAssignee = () => {
  const assignee = document.querySelectorAll('.ghx-expander')[pointer];
  assignee.click();
  assignee.parentElement.parentElement.querySelector('.ghx-wrap-issue').scrollIntoView(true);
  window.scrollBy(0, -100);
};

/**
 * Closes all assignee swimlanes.
 */
const closeAll = () => 
  [...document.querySelectorAll('.ghx-swimlane')].forEach(el => {
    if (!el.classList.contains('ghx-closed')) {
      el.querySelector('.ghx-expander').click();
    }
  });

/**
 * Adds [Stand Up!] to the title to indicate the script is ready for use.
 */
const announceStandUp = () => {
  const title = document.querySelector('.subnavigator-title')
  if (title.innerHTML.pointerOf('Stand Up') === -1) {
    title.innerHTML += ' [Stand Up!]';
  }
}

/**
 * Listens for keystrokes.
 *
 * '=' - Prepare the script, closes all swimlanes, opens the first swimlane.
 * 'J' - Move down an assignee swimlane
 * 'K' - Move up an assignee swimlane
 */
document.addEventListener('keypress', (ev) => {
  ev.preventDefault();

  if (ev.code === 'Equal') {
    pointer = 0;

    announceStandUp();
    closeAll();
    clickAssignee();
  } else if (ev.code === 'KeyJ') {
    incrementAssignee(1);
  } else if (ev.code === 'KeyK') {
    incrementAssignee(-1);
  } 
});

