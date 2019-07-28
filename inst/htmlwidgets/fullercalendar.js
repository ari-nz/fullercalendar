HTMLWidgets.widget({

  name: 'fullercalendar',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance


    var initialized = false;
    var elementId = el.id;
    var container = document.getElementById(elementId);
    var calendar = new FullCalendar.Calendar(container, {
        plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
        selectable: true,
        selectMirror: true,
        select: function(arg) {
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        eventClick: function(info) {
          alert('Event: ' + info.event.title);
          alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
          alert('View: ' + info.view.type);

          // change the border color just for fun
          info.el.style.borderColor = 'red';
        },

        eventLimit: true, // allow "more" link when too many events
    })



    return {


    renderValue: function(x) {

        if (!initialized) {
          initialized = true;
        }

        if (HTMLWidgets.shinyMode) {
          Shiny.onInputChange(elementId + "_events", calendar.getEvents());

          Shiny.onInputChange(elementId + "_state", calendar.state);
        }



        var opts = x
        window.fc_opts = opts

        console.log(opts)
        console.log(elementId)
        console.log(calendar)

        calendar.changeView('timeGridWeek');
        calendar.setOption('editable'    , true);
        calendar.setOption('dropppable'  , true);
        calendar.addEventSource('https://fullcalendar.io/demo-events.json');


        console.log(calendar)

/*
        var calendar = new FullCalendar.Calendar(el, {
          plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
          defaultView: 'timeGridWeek',
      //    defaultDate: '2019-04-07',
      //		allDaySlot: false,
      		editable: true,
      //    header: {
      //      left: 'prev,next today',
      //      center: 'title',
      //      right: 'timeGridWeek'
      //    },
      		droppable: true,
      		events: 'https://fullcalendar.io/demo-events.json'
        });
        */




        el.fullobject = calendar;
        calendar.render();



      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});