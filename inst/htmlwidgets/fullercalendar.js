HTMLWidgets.widget({

  name: 'fullercalendar',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {


      renderValue: function(opts) {
        console.log("Options are")
        console.log(opts)
        var opts = opts

        console.log("Element is")
        console.log(el)

        var calendarEl = el
        //debugger;
         // $(el).fullCalendar( 'destroy' );
        var calendar = new FullCalendar.Calendar(el, opts);

        calendar.render();
        // $(el).fullCalendar(x);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});