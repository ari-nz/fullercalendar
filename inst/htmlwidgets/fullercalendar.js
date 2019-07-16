HTMLWidgets.widget({

  name: 'fullercalendar',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {


    renderValue: function(x) {
        var opts = x
        window.fc_opts = opts

        console.log(opts)
        console.log(el)

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

        calendar.render();



      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});