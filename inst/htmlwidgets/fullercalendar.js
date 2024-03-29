
HTMLWidgets.widget({

  name : 'fullercalendar',
  type : 'output',

  factory : function(el, width, height, opts) {

    var elementId = el.id;
    var container = document.getElementById(elementId);
    var initialized = false;

    return {

      renderValue: function(opts) {

        window.fc_opts = opts



        if (!initialized) {
          initialized = true;

          var calendar = new FullCalendar.Calendar(container, {
            plugins: opts.plugins,
            defaultView: opts.defaultView,
            defaultDate: opts.defaultDate
          });

          window.mycalendar = calendar
          container.widget = this;
          calendar.render();

        }

        // Clear calendar each time the process goes on.
        calendar.removeAllEvents();



        // Add all events
        if(opts.events !== null){
         for(var i = 0; i < opts.events.length; i++){
           calendar.addEvent(opts.events[i]);
         }
        }



        // Set settings as defined in R's ... construct
        var obj = opts.settings
        for (var i in obj) {
          if (obj.hasOwnProperty(i)) {
            calendar.setOption(i, obj[i])
          }
        };

        // Change settings that cannot be modified dynamically
        if(calendar.getOption('defaultView') !== opts.defaultView){
          calendar.changeView(opts.defaultView)
        };

        if(calendar.getOption('defaultDate') !== opts.defaultDate){
          calendar.gotoDate(opts.defaultDate)
        }




      },

      resize : function(width, height) {
        // we won't be implementing a resize function
      },


    };
  }
});

//if (HTMLWidgets.shinyMode) {
//  var fxns = ['addEvent'];
//  debugger;
//  var addShinyHandler = function(fxn) {
//    return function() {
//      debugger;
//      Shiny.addCustomMessageHandler(
//        "FullCalendar:" + fxn, function(message) {
//          var el = document.getElementById(message.id);
//          if (el) {
//            el.widget[fxn](message);
//          }
//        }
//      );
//    };
//  };
//
//  for (var i = 0; i < fxns.length; i++) {
//    addShinyHandler(fxns[i])();
//  }
//}



// HTMLWidgets.widget({
//
//  name: 'fullercalendar',
//
//  type: 'output',
//
//  factory: function(el, width, height) {
//
//    // TODO: define shared variables for this instance
//        var elementId = el.id;
//
//
//
//
//    return {
//
//
//    renderValue: function(x) {
//
//        var opts = x
//        var settings = opts.settings
//        window.fc_opts = opts
//
//        console.log("Opts are: ", opts)
//        console.log("Settings are: ", settings)
//        console.log("Element is: ", el)
//
//
//        var calendar = new FullCalendar.Calendar(el, {
//          plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
//          defaultView: 'timeGridWeek',
//      //    defaultDate: '2019-04-07',
//      //    allDaySlot: false,
//          editable: true,
//      //    header: {
//      //      left: 'prev,next today',
//      //      center: 'title',
//      //      right: 'timeGridWeek'
//      //    },
//          droppable: true,
//          events: opts.events, //'https://fullcalendar.io/demo-events.json'
//
//
//          editable: true,
//          eventLimit: true,
//          selectable: true,
//          selectMirror: true,
//          select: function(arg) {
//            var title = prompt('Event Title:');
//            if (title) {
//              calendar.addEvent({
//                title: title,
//                start: arg.start,
//                end: arg.end,
//                allDay: arg.allDay
//              })
//            }
//            calendar.unselect()
//          },
//          eventClick: function(info) {
//            alert('Event: ' + info.event.title);
//            alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
//            alert('View: ' + info.view.type);
//
//            // change the border color just for fun
//            info.el.style.borderColor = 'red';
//          }
//
//
//
//        });
//
//        window.mycalendarvar = calendar
//        calendar.render();
//
//
//         if (HTMLWidgets.shinyMode) {
//            console.log("Is Shiny: ", HTMLWidgets.shinyMode)
//
//           var storedEvents = calendar.getEvents();
//
//            // See: https://fullcalendar.io/docs/event-parsing
//            // https://fullcalendar.io/docs/event-object
//            Shiny.onInputChange(
//              elementId,
//              JSON.stringify(
//                storedEvents.map(function(ev) {
//                  return {
//                    allDay             : ev.allDay
//                    , title              : ev.title
//                    , start              : ev.start
//                    , end                : ev.end
//                    , allow              : ev.allow
//                    , id                 : ev.id
//                    , backgroundColor    : ev.backgroundColor
//                    , borderColor        : ev.borderColor
//                    , classNames         : ev.classNames
//                    , constraint         : ev.constraint
//                    , durationEditable   : ev.durationEditable
//                    , groupId            : ev.groupId
//                    , overlap            : ev.overlap
//                    , rendering          : ev.rendering
//                    , startEditable      : ev.startEditable
//                    , textColor          : ev.textColor
//                    , url                : ev.url
//
//                  }
//
//                })
//              )
//              );
//                    // Items have been manually selected
//                   // timeline.on('select', function (properties) {
//                   //   Shiny.onInputChange(
//                   //     elementId + "_selected",
//                   //     properties.items
//                   //   );
//                   // });
//         }
//
//
//
//        //calendar.optionsManager
//
//
//      },
//
//
//
//      resize: function(width, height) {
//
//        // TODO: code to re-render the widget with a new size
//
//      }
//
//
//      //  resize: function(el, width, height, instance) {
//      //
//      //    instance.hot.updateSettings({ width: width,
//      //                                  height: height
//      //    });
//      //  },
//
//
//
//
//
//    };
//  }
//});