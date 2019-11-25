HTMLWidgets.widget({

  name: 'fullercalendar',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance
        var elementId = el.id;




    return {


    renderValue: function(x) {

        var opts = x
        var settings = opts.settings
        window.fc_opts = opts

        console.log("Opts are: ", opts)
        console.log("Settings are: ", settings)
        console.log("Element is: ", el)



        var calendar = new FullCalendar.Calendar(el, {
          plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
          defaultView: 'timeGridWeek',
      //    defaultDate: '2019-04-07',
      //    allDaySlot: false,
          editable: true,
      //    header: {
      //      left: 'prev,next today',
      //      center: 'title',
      //      right: 'timeGridWeek'
      //    },
          droppable: true,
          events: opts.events, //'https://fullcalendar.io/demo-events.json'


          editable: true,
          eventLimit: true,
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
          }
        });

        window.mycalendarvar = calendar
        calendar.render();


         if (HTMLWidgets.shinyMode) {
            console.log("Is Shiny: ", HTMLWidgets.shinyMode)

           var storedEvents = calendar.getEvents();

            // See: https://fullcalendar.io/docs/event-parsing
            // https://fullcalendar.io/docs/event-object
            Shiny.onInputChange(
              elementId,
              JSON.stringify(
                storedEvents.map(function(ev) {
                  return {
                    allDay             : ev.allDay
                    , allow              : ev.allow
                    , backgroundColor    : ev.backgroundColor
                    , borderColor        : ev.borderColor
                    , classNames         : ev.classNames
                    , constraint         : ev.constraint
                    , durationEditable   : ev.durationEditable
                    , end                : ev.end
                    , extendedProps      : ev.extendedProps
                    , groupId            : ev.groupId
                    , id                 : ev.id
                    , overlap            : ev.overlap
                    , rendering          : ev.rendering
                    , start              : ev.start
                    , startEditable      : ev.startEditable
                    , textColor          : ev.textColor
                    , title              : ev.title
                    , url                : ev.url

                  }

                })
              )
              );
                    // Items have been manually selected
                   // timeline.on('select', function (properties) {
                   //   Shiny.onInputChange(
                   //     elementId + "_selected",
                   //     properties.items
                   //   );
                   // });
         }



        //calendar.optionsManager


      },



      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }


      //  resize: function(el, width, height, instance) {
      //
      //    instance.hot.updateSettings({ width: width,
      //                                  height: height
      //    });
      //  },





    };
  }
});