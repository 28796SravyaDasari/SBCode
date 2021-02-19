// Controller of Notes List Page.
// It will call NoteDB Services to present data to html view.
appControllers.controller('JavaScriptController', function ($scope, $stateParams, $timeout, NoteDB, $state, $ionicPopup, $ionicModal, $ionicPopover, $ionicLoading, $http, $filter, ionicDatePicker) {

    $('#myListToTime').timepicker({ 'timeFormat': 'H:i:s', 'forceRoundTime': true });
    $('#myListFromTime').timepicker({ 'timeFormat': 'H:i:s', 'forceRoundTime': true });


    $scope.initDatePicker = function () {

    }

    $scope.initDatePickerMyList = function () {

    }


    $scope.userAttendance = []
    var attendance = []
    $scope.CourseId = ''
    $scope.DayId = ''
    $scope.SlotId = ''
    $scope.SubjectId = ''

    Array.prototype.remove = function () {
        var what, a = arguments, L = a.length, ax;
        while (L && this.length) {
            what = a[--L];
            while ((ax = this.indexOf(what)) != -1) {
                this.splice(ax, 1)
            }
        }
        return this;
    }

    $scope.addAttendance = function (id) {
        $scope.userAttendance.push(id)
        //console.log($scope.userAttendance)
    }

    function isEvenOdd(count) {
        if (count % 2 == 0)
            return 'absent'
        else
            return 'present'
    }

    $scope.logAttendance = function () {
        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'MarkAttendance',
            Teacherid: localStorage.getItem('TeacherId'),
            CourseId: $scope.CourseId,
            SlotId: $scope.SlotId,
            Dayid: $scope.DayId,
            Subjectid: $scope.SubjectId,
            Attendance: $scope.user.roles.toString(),
            Date: $scope.month = $filter('date')(new Date(), "yyyy-MM-dd HH:mm:ss.sss")
        }

        console.log(data)
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/MarkAttendance'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
                //$scope.showAlert('Error', 'Login Failed. Please try again with valid credentials.')
            } else {
                console.log(response.data)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });

    };

    //$scope.logAttendance = function () {
    //    Object.size = function (obj) {
    //        var size = 0, key;
    //        for (key in obj) {
    //            if (obj.hasOwnProperty(key)) {
    //                size++
    //            }
    //        }
    //        return size
    //    }

    //    Array.prototype.contains = function (v) {
    //        for (var i = 0; i < this.length; i++) {
    //            if (this[i] === v)
    //                return true
    //        }
    //        return false
    //    };

    //    Array.prototype.unique = function () {
    //        var arr = [];
    //        for (var i = 0; i < this.length; i++) {
    //            if (!arr.contains(this[i])) {
    //                arr.push(this[i])
    //            }
    //        }
    //        return arr
    //    }

    //    var counts = {}
    //    $scope.userAttendance.forEach(function (x) {
    //        counts[x] = (counts[x] || 0) + 1;
    //    })

    //    $scope.userUniqAttendance = $scope.userAttendance.unique();
    //    var allPresentRollNuber = []
    //    for (var i = 0; i < $scope.userUniqAttendance.length ; i++) {
    //        if (isEvenOdd(counts[$scope.userUniqAttendance[i]]) == 'present') {
    //            allPresentRollNuber.push($scope.userUniqAttendance[i])
    //        }
    //        else {
    //            //console.log($scope.userUniqAttendance[i] + ' Absent ' + counts[$scope.userUniqAttendance[i]])
    //        }
    //    }

    //    var data = {
    //        teacherid: '1',
    //        courseId: '1',
    //        slotId: '1',
    //        dayid: '1',
    //        subjectId: '1',
    //        Attendance: allPresentRollNuber.toString()
    //    }
    //    console.log(data)

    //}

    $ionicPopover.fromTemplateUrl('templates/popover-Atten.html', {
        scope: $scope,
    }).then(function (popover) {
        $scope.popover = popover;
    });



    $scope.roles = [];
    $scope.rolesForClass = [];
    $scope.roles = [];
    $scope.roles = [];


    $scope.loadStudens = function () {
        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'GetStudid',
            TeacherId: localStorage.getItem('TeacherId'),
            Date: $filter('date')(new Date(), "yyyy-MM-dd HH:mm:ss.sss")
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/AttendanceMaster'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
                //$scope.showAlert('Error', 'Login Failed. Please try again with valid credentials.')
            } else {
                for (var i = 0; i < response.data.length; i++) {
                    $scope.roles[i] = {
                        id: response.data[i].studentid
                    };
                }
                $scope.CourseId = response.data[0].courseid
                $scope.DayId = response.data[0].dayid
                $scope.SlotId = response.data[0].slot
                $scope.SubjectId = response.data[0].subjectid

                console.log(response.data)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }

    $scope.closepops = function () {
        $scope.popover.hide();

    }
    $scope.goadd = function () {
        $scope.popover.hide();
        $state.go('app.addattendance');
    }
    $scope.goapprove = function () {
        $scope.popover.hide();
        $state.go('app.approvelist');
    }
    $scope.gorecord = function () {
        $scope.popover.hide();
        $state.go('app.attendance');
    }

    $scope.golists = function () {
        $scope.popover.hide();
        $state.go('app.mylists');
    }

    /*POPOVER FUNCTIONS ENDS*/
    $scope.rollnumber = true
    $scope.class = false

    $scope.rollnumberfunc = function () {

        $scope.rollnumber = true
        $scope.class = false

    }
    $scope.classfunc = function () {

        $scope.rollnumber = false
        $scope.class = true

    }

    $scope.studenttotal = $scope.roles.length

    $scope.loadClassAttendance = function () {
        $scope.specialAttendanceClass = [
        {
            id: '1',
            name: 'Vaibhav Gole',
            percent: 45
        }, {
            id: '2',
            name: 'Sandesh Bhatkal',
            percent: 34
        }, {
            id: '3',
            name: 'Yashesh Bharti',
            percent: 55
        }];
    }

    $scope.searchStudent = function (rollno, searchDate) {

        $scope.specialAttendance = [
        {
            id: '1',
            name: 'Marathi',
            percent: 45
        }, {
            id: '2',
            name: 'Hindi',
            percent: 34
        }, {
            id: '3',
            name: 'English',
            percent: 55
        }];

        //$ionicLoading.show({
        //    content: 'Loading'
        //   , animation: 'fade-in'
        //   , showBackdrop: true
        //   , maxWidth: 200
        //   , template: 'Loading..'
        //   , showDelay: 0
        //});

        //searchDate = document.getElementById('searchDate').value
        //var data = {
        //    Flag: 'IndividualAttendance',
        //    StudId: rollno,
        //    Date: $filter('date')(searchDate, "yyyy-MM-dd HH:mm:ss.sss")
        //}
        //$http({
        //    method: 'post'
        //    , url: 'http://yasheshbharti.com/api/IndividualAttendance'
        //    , data: data
        //}).then(function successCallback(response) {
        //    if (response.data.length == 0) {
        //        $scope.recordFound = false
        //        //$scope.showAlert('Error', 'Login Failed. Please try again with valid credentials.')
        //    } else {
        //        $scope.recordFound=true
        //        //$scope.IndiAttendance = response.data
        //        for (var i = 0; i < response.data.length; i++) {
        //            $scope.roles[i] = {
        //                id: response.data[i].id,
        //                subName: response.data[i].SubName,
        //            };
        //        }
        //        $scope.StudentName = response.data[0].Studname
        //        $scope.CourseId = response.data[0].courseid
        //        $scope.DayId = response.data[0].dayid
        //        $scope.SlotId = response.data[0].slot
        //        $scope.SubjectId = response.data[0].subjectid

        //        //console.log($scope.roles)
        //    }
        //    $ionicLoading.hide();
        //}, function errorCallback(response) {
        //    $ionicLoading.hide();
        //    // called asynchronously if an error occurs
        //    // or server returns response with an error status.
        //});
    }

    var ipObj1 = {
        callback: function (val) {  //Mandatory
            $scope.Date = $filter('date')(new Date(val), "yyyy-MM-dd")
        },
        inputDate: new Date(),      //Optional
        mondayFirst: true,          //Optional
        //disableWeekdays: [0],       //Optional
        closeOnSelect: false,       //Optional
        templateType: 'popup'       //Optional
    };

    $scope.openDatePicker = function () {
        ionicDatePicker.openDatePicker(ipObj1);
    };

    $scope.openDatePicker2 = function (id) {
        var ipObj2 = {
            callback: function (val) {  //Mandatory
                document.getElementById(id).value = $filter('date')(new Date(val), "yyyy-MM-dd")
            },
            inputDate: new Date(),      //Optional
            mondayFirst: true,          //Optional
            //disableWeekdays: [0],       //Optional
            closeOnSelect: false,       //Optional
            templateType: 'popup'       //Optional
        };
        ionicDatePicker.openDatePicker(ipObj2);
    };

    $scope.showAlert = function (title, content) {
        $ionicPopup.alert({
            title: title,
            content: content
        }).then(function (res) {

        });
    }



    $scope.addIndiAttendance = function (RollNumber) {

        var jsonVal = []
        for (var i = 0; i < $scope.specialAttendance.length; i++) {
            if ($scope.specialAttendance[i].percent == undefined) {
                jsonVal.push($scope.specialAttendance[i].id)
            }
        }
        if (jsonVal.length > 0) {
            $scope.showAlert('Error', 'invalid percent enter for roll numbers ' + JSON.stringify(jsonVal))
            console.log('invalid percent enter for roll numbers ' + JSON.stringify(jsonVal))
        }



        //console.log(jsonVal.toString())

        //$ionicLoading.show({
        //    content: 'Loading'
        //   , animation: 'fade-in'
        //   , showBackdrop: true
        //   , maxWidth: 200
        //   , template: 'Loading..'
        //   , showDelay: 0
        //});

        //var data = {
        //    Flag:'MarkIndividualAttendance',
        //    StudId: RollNumber,
        //    Subjectid:$scope.user.roles.toString(),
        //    Date: $filter('date')(document.getElementById('searchDate').value, "yyyy-MM-dd HH:mm:ss.sss")
        //}
        //$http({
        //    method: 'post'
        //    , url: 'http://yasheshbharti.com/api/IndividualAttendance'
        //    , data: data
        //}).then(function successCallback(response) {
        //    if (response.data.length == 0) {

        //    } else {
        //       console.log(response.data)
        //    }
        //    $ionicLoading.hide();
        //}, function errorCallback(response) {
        //    $ionicLoading.hide();

        //});
    }

    $scope.markClasssAttendance = function (classDate, corse) {
        var data = {
            Flag: 'MarkClassAttendance',
            CourseId: corse,
            Date: classDate,
            SlotId: $scope.user.roles.toString()
        }
        console.log($scope.specialAttendanceClass)
    }

    $scope.loadCourseDetails = function () {
        $scope.initDatePicker();
        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'GetCourseMaster'
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/GetCourseMaster'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {

            } else {
                $scope.Course = response.data
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });
    }

    $scope.loadEvantDetails = function () {

        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'LoadEvent'
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/GetCourseMaster'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {

            } else {
                $scope.Event = response.data
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });
    }

    $scope.lookForClassSlots = function (classDate, corse) {
        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'ClassAttendance',
            CourseId: corse,
            Date: classDate
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/LoadClassAttendance'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {

            } else {
                for (var i = 0; i < response.data.length; i++) {
                    $scope.rolesForClass[i] = {
                        slot: response.data[i].slot,
                        SubjectName: response.data[i].SubjectName,
                        fromslot: response.data[i].fromslot,
                        toslot: response.data[i].toslot,
                    };
                }
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });
    }

    $scope.markEventAttendance = function (event) {
        if (event == undefined)
            return alert('Invalid entries')
        var rollno = event.rollNoMyList
        var Fromdate = document.getElementById('myListFromDate').value
        var ToDate = document.getElementById('myListToDate').value
        var EventName = event.eventName
        var FromTime = document.getElementById('myListFromTime').value
        var ToTime = document.getElementById('myListToTime').value

        if (rollno == '' || rollno == undefined || rollno == null)
            return alert('Please enter student roll number')

        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'EnterEvent',
            StudId: event.rollNoMyList,
            Fromdate: document.getElementById('myListFromDate').value,
            ToDate: document.getElementById('myListToDate').value,
            EventName: event.eventName,
            FromTime: document.getElementById('myListFromTime').value,
            ToTime: document.getElementById('myListToTime').value,
            TeacherId: localStorage.getItem('TeacherId')
        }
        console.log(data)
        //return;

        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/EventDetails'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
                alert('Entry added successfully')
                $scope.evnt.eventName = ''
                $scope.evnt.rollNoMyList = ''
                document.getElementById('myListFromDate').value
                document.getElementById('myListToDate').value
                document.getElementById('myListFromTime').value
                document.getElementById('myListToTime').value
            } else {
                $scope.MarkStatus = response.data
                alert(JSON.stringify(response.data))
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });

    }


    $ionicModal.fromTemplateUrl('templates/modal.html', {
        scope: $scope
    }).then(function (modal) {
        $scope.modal = modal;
    });

    $scope.createContact = function (u) {

    };

    $scope.getStudentsDetailsbyEvntId = function (eventID) {
        $scope.EvntStudents = [{ StudId: '10' }, { StudId: '170' }, { StudId: '103' }, { StudId: '130' }]
        console.log($scope.EvntStudents)
    }


    $scope.showConfirmPopUp = function (eventId, val, eventName) {

        $scope.EventId = eventId
        $scope.EventName = eventName


        var confirmPopup = $ionicPopup.confirm({
            title: val + ' List',
            template: 'Are you sure you want ' + val + ' this list? <br>'
            //'<a ng-repeat="item in ' + angular.element($scope.EvntStudents).serialize() + '">bgf</a>'
        });
        confirmPopup.then(function (res) {
            if (res) {
                if (val == 'Approve') {
                    $scope.modal.show()
                    $scope.getStudentsDetailsbyEvntId(eventId)
                    // $scope.approveEventAttendance(eventId)
                } else {
                    alert('comming soon')
                }
            } else {
                console.log('You are not sure');
            }
        });
    };

    $scope.approveEventAttendance = function () {

        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'APPROVED',
            EventId: $scope.EventId,
            ApprovedBy: localStorage.getItem('TeacherId')
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/ApproveEventAttendance'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {

            } else {
                $scope.ApprovedStatus = response.data
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });
    }

    $scope.loadEventAttendancetoApprove = function () {
        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'LoadCount'
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/GetPendingEventAttendance'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {

            } else {
                $scope.PendingApptendance = response.data
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });
    }

    $scope.user = {
        roles: []
    };

    $scope.userForClass = {
        roles: []
    };

    $scope.user = {
        roles: []
    };


    $scope.allabsent = true;
    $scope.checkAll = function () {
        console.log($scope.roles[0].id)
        //for (i = 0; i < $scope.roles.length; i++) {
        //    allPresentRollNuber.push($scope.roles[i].id)
        //}

        $scope.allpresent = true;
        $scope.allabsent = false;

        $scope.user.roles = $scope.roles.map(function (item) { return item.id; });
    };
    $scope.uncheckAll = function () {
        allPresentRollNuber = []
        $scope.allpresent = false;
        $scope.allabsent = true;
        $scope.user.roles = [];
    };
    $scope.checkFirst = function () {
        $scope.user.roles.splice(0, $scope.user.roles.length);
        $scope.user.roles.push(1);
    };




    /*        $scope.rolls = [];
  for (var i=0; i<40; i++) {
    $scope.rolls[i] = {
      name: i,
    };
  
  }

    
     $scope.checkAll = function () {
         alert("called")
          $scope.selectedAll = true;
     
        angular.forEach($scope.rolls, function (item) {
            item.Selected = true;
        });

    };
      $scope.uncheckAll = function () {
          $scope.selectedAll = false;
        if ($scope.selectedAll) {
            $scope.selectedAll = true;
        } else {
            $scope.selectedAll = false;
        }
        angular.forEach($scope.rolls, function (name) {
            name.Selected = $scope.selectedAll;
        });

    };*/


    // initialForm is the first activity in the controller. 
    // It will initial all variable data and let the function works when page load.
    $scope.initialForm = function () {

        //$scope.isLoading is the variable that use for check statue of process.
        $scope.isLoading = true;

        //$scope.isAnimated is the variable that use for receive object data from state params.
        //For enable/disable row animation.
        $scope.isAnimated = $stateParams.isAnimated;

        // $scope.noteList is the variable that store data from NoteDB service.
        $scope.noteList = [];

        // $scope.filterText is the variable that use for searching.
        $scope.filterText = "";

        // The function for loading progress.
        $timeout(function () {
            if ($scope.isAndroid) {
                jQuery('#note-list-loading-progress').show();
            }
            else {
                jQuery('#note-list-loading-progress').fadeIn(700);
            }
        }, 400);
        $timeout(function () {

            //Get all notes from NoteDB service.
            $scope.noteList = NoteDB.selectAll();

            jQuery('#note-list-loading-progress').hide();
            jQuery('#note-list-content').fadeIn();
            $scope.isLoading = false;
        }, 3000);// End loading progress.

    };//End initialForm.

    // navigateTo is for navigate to other page 
    // by using targetPage to be the destination page 
    // and sending objectData to the destination page.
    // Parameter :  
    // targetPage = destination page.
    // objectData = object that will sent to destination page.
    $scope.navigateTo = function (targetPage, objectData) {
        $state.go(targetPage, {
            noteDetail: objectData,
            actionDelete: (objectData == null ? false : true)
        });
    };// End navigateTo.

    $scope.initialForm();
});// End of Notes List Page  Controller.
