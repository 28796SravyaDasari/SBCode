// Controller of Notes List Page.
// It will call NoteDB Services to present data to html view.
appControllers.controller('noteListCtrl', function ($scope, $stateParams, $timeout,$interval, NoteDB, $state, $ionicPopup,$window, $ionicModal, $ionicPopover, $ionicLoading, $http, $filter, ionicDatePicker) {

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
                $scope.showAlert('Sucess', 'Attendance recorded succesfully.')
                $state.go('app.home')
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
            TeacherId: parseInt(localStorage.getItem('TeacherId')),
            Date: $filter('date')(new Date(), "yyyy-MM-dd HH:mm:ss.sss")
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/AttendanceMaster'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
                //$scope.showAlert('Error', 'Login Failed. Please try again with valid credentials.')
                $scope.noStudentsToDisplay=true
            } else {
                $scope.noStudentsToDisplay = false
                $scope.TotalStudCount=response.data.length
                $scope.TotalStudPCount=0
                for (var i = 0; i < response.data.length; i++) {
                    $scope.roles[i] = {
                        id: response.data[i].studentid,
                        RollNo: response.data[i].rollno
                    };

                    if(response.data[i].Attendencestatus==1){
                        $scope.TotalStudPCount=$scope.TotalStudPCount+1
                    $scope.user.roles.push(response.data[i].studentid)
                }
                }

                console.log($scope.userAttendance)


                $scope.CourseId = response.data[0].courseid
                $scope.DayId = response.data[0].dayid
                $scope.SlotId = response.data[0].slotid
                $scope.SubjectId = response.data[0].subjectid
                $scope.toSlotTime = response.data[0].totime
                $scope.toSlotTime1 = response.data[0].totime
                $scope.SubjectName = response.data[0].SubjectName
                $scope.CourseName = response.data[0].CourseName

                $interval(startTimer, 1000);
                console.log(response.data)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }

    function startTimer() {
        var currDate = $filter('date')(new Date(), "yyyy-MM-dd")
       
        var countDownDate = new Date(currDate + ' ' + $scope.toSlotTime1).getTime();

        // Update the count down every 1 second
        //var x = setInterval(function () {

            // Get todays date and time
            var now = new Date().getTime();

            // Find the distance between now an the count down date
            var distance = countDownDate - now;

            // Time calculations for days, hours, minutes and seconds
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            // Output the result in an element with id="demo"
            $scope.toSlotTime =hours+'h '+ minutes + "m " + seconds + "s ";

            // If the count down is over, write some text 
            if (distance < 0) {
                clearInterval(x);
                $scope.toSlotTime = "";
            }
            
        //}, 1000);
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
        $scope.showFooter = false
        $scope.rollnumber = true
        $scope.class = false

    }
    $scope.classfunc = function () {
        $scope.showFooter = true
        $scope.rollnumber = false
        $scope.class = true

    }

    $scope.studenttotal = $scope.roles.length

    $scope.loadStudByCourse = function (courseId) {
        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'GetStudentidByCourses',
            CourseId: courseId
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/GetDetails'
            , data: data
        }).then(function successCallback(response) {
            $ionicLoading.hide();
            if (response.data.length == 0) {
                //$scope.showAlert('Error', 'Login Failed. Please try again with valid credentials.')
                console.log(response.data)
                $scope.rolesForClass = []
            } else {
                for (i = 0; i < response.data.length; i++) {

                    $scope.rolesForClass[i] = {
                        rollno: response.data[i].rollno,
                        id: response.data[i].id
                    };
                }

                console.log($scope.rolesForClass)

            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }
    $scope.NewAttandance = []
    $scope.addStudentsinArray = function () {
        //$scope.NewAttandance = []
        $scope.NewAttandance.push($scope.user.rolesForClass)
        $scope.showAlert('Sucess', 'Students added successfully.')
        $scope.studentAdded=true
        //console.log(JSON.stringify($scope.NewAttandance[0]))
    }

    $scope.deleteMyList = function (eventId) {
        var confirmPopup = $ionicPopup.confirm({
            title: 'Delete List',
            template: 'Are you sure you want to delete this list? <br> This action can not be reversed.'
            //'<a ng-repeat="item in ' + angular.element($scope.EvntStudents).serialize() + '">bgf</a>'
        });
        confirmPopup.then(function (res) {
            if (res) {
                var data = {
                    Flag: 'DeleteList',
                    EventID: eventId
                }
              
                $http({
                    method: 'post'
                    , url: 'http://yasheshbharti.com/api/UpdateDetails'
                    , data: data
                }).then(function successCallback(response) {
                    if (response.data.length == 0) {
                        $scope.showAlert('Sucess', 'List has been deleted.')
                        $scope.loadEvantDetails();
                    } else {
                        $scope.DFRrgrtgrt = response.data
                        alert(JSON.stringify(response.data))
                    }
                    $ionicLoading.hide();
                }, function errorCallback(response) {
                    $ionicLoading.hide();

                });
            } else {
                console.log('You are not sure');
            }
        });
    }

    $scope.markClassEventAttendance = function (event,status) {
        var msg=''
        if (status == 'Pending') { msg = 'Are you sure you want to submit list.' }
        if (status == 'Saved') { msg = 'Are you sure you want to save list.' }

        var msg2 = ''
        if (status == 'Pending') { msg2 = 'Your list has been submitted for approval.' }
        if (status == 'Saved') { msg2 = 'Your list has been Saved.' }

        var rollno = ''
        try {
            rollno = $scope.user.rolesForClass.toString()
        } catch (e) {
            $scope.showAlert('Error', 'Please select student roll no')
            return;
        }
        var EventName = ''

        if (event.eventId == 'newList') {
            EventName = event.eventName
        } else {
            for (var i = 0; i < $scope.Event.length; i++) {
                if ($scope.Event[i].Eventid == event.eventId) {
                    EventName=$scope.Event[i].EventName
                }
            }
        }
        var Fromdate = document.getElementById('myListFromDate').value
        var ToDate = document.getElementById('myListToDate').value
        
        var FromTime = document.getElementById('myListFromTime').value
        var ToTime = document.getElementById('myListToTime').value

        if (rollno == '' || rollno == undefined || rollno == null) {
            $scope.ErrorMsg = 'Please enter student roll number'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        if (Fromdate == '' || Fromdate == undefined || Fromdate == null) {
            $scope.ErrorMsg = 'Please enter from date'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        if (ToDate == '' || ToDate == undefined || ToDate == null) {
            $scope.ErrorMsg = 'Please enter to date'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        if (FromTime == '' || FromTime == undefined || FromTime == null) {
            $scope.ErrorMsg = 'Please enter from time'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        if (ToTime == '' || ToTime == undefined || ToTime == null) {
            $scope.ErrorMsg = 'Please enter to time'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        if (EventName == '' || EventName == undefined || EventName == null) {
            $scope.ErrorMsg = 'Please enter event name'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        var r = confirm(msg);
        if (r == true) {
            $scope.ErrorMsg = ''

            //$ionicLoading.show({
            //    content: 'Loading'
            //   , animation: 'fade-in'
            //   , showBackdrop: true
            //   , maxWidth: 200
            //   , template: 'Loading..'
            //   , showDelay: 0
            //});

            var data = {
                Flag: 'EnterEvent',
                StudId: JSON.stringify($scope.NewAttandance[0]),
                Fromdate: document.getElementById('myListFromDate').value,
                ToDate: document.getElementById('myListToDate').value,
                EventName: EventName,
                FromTime: document.getElementById('myListFromTime').value,
                ToTime: document.getElementById('myListToTime').value,
                TeacherId: localStorage.getItem('TeacherId'),
                Status: status
            }

            //console.log(data)
            //return;
            $http({
                method: 'post'
                , url: 'http://yasheshbharti.com/api/EventDetails'
                , data: data
            }).then(function successCallback(response) {
                if (response.data.length == 0) {
                    alert(msg2)
                    $window.location.reload()
                    document.getElementById('myListFromDate').value = ''
                    document.getElementById('myListToDate').value = ''
                    document.getElementById('myListFromTime').value = ''
                    document.getElementById('myListToTime').value = ''
                } else {
                    $scope.MarkStatus = response.data
                    alert(JSON.stringify(response.data))
                }
                $ionicLoading.hide();
            }, function errorCallback(response) {
                $ionicLoading.hide();

            });

            console.log($scope.user.rolesForClass.toString())
        } else {
            console.log('submit list cancelled')
        }

        
    }

    $scope.loadClassAttendance = function (courseId) {
        console.log(courseId)
        if (courseId == '' || courseId == null || courseId == undefined) {
            $scope.specialAttendanceClass=''
            return false;
        }
        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'LoadClassAttendance',
            CourseId: courseId
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/AddAttendance'
            , data: data
        }).then(function successCallback(response) {
            $scope.showFooter = true
            $scope.specialAttendanceClass = response.data
            console.log(response.data)

            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });

        //$scope.specialAttendanceClass = [
        //{
        //    id: '1',
        //    name: 'Vaibhav Gole',
        //    percent: 45
        //}, {
        //    id: '2',
        //    name: 'Sandesh Bhatkal',
        //    percent: 34
        //}, {
        //    id: '3',
        //    name: 'Yashesh Bharti',
        //    percent: 55
        //}];
    }

    $scope.searchStudentOnrefresh = function (RollNumber, Date) {
        if (RollNumber == '' || RollNumber == null || RollNumber == undefined)
        {
            $scope.$broadcast('scroll.refreshComplete');
            return;
        }
        $scope.searchStudent(RollNumber, Date)
        $scope.$broadcast('scroll.refreshComplete');
    }

    $scope.searchStudent = function (rollno, searchDate) {

        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'LoadIndividualAttendance',
            StudId: rollno,
        }

        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/AddAttendance'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length < 1) {
                $ionicLoading.hide();
                $scope.showAlert('Error', 'Student not found')
                
                return
            }
            $scope.specialAttendance = response.data
            console.log($scope.specialAttendance)
            var total = 0
            for (i = 0; i < $scope.specialAttendance.length; i++) {
                total = total + $scope.specialAttendance[i].Per
            }
            $scope.totalPercent = Math.round(total / $scope.specialAttendance.length)
            $scope.StudName = response.data[0].StudName
            $scope.StudID = response.data[0].Studid
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });


        //$scope.specialAttendance = [
        //{
        //    id: '1',
        //    name: 'Marathi',
        //    percent: 45
        //}, {
        //    id: '2',
        //    name: 'Hindi',
        //    percent: 34
        //}, {
        //    id: '3',
        //    name: 'English',
        //    percent: 55
        //}];

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
            from: new Date(localStorage.getItem('FromDate')), //Optional
            to: new Date(localStorage.getItem('ToDate')),
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
            if ($scope.specialAttendance[i].Per == undefined || $scope.specialAttendance[i].Per > 100) {
                jsonVal.push($scope.specialAttendance[i].SubName)
            }
        }

        if (jsonVal.length > 0) {
            $scope.showAlert('Error', 'invalid percent enter for Subject ' + JSON.stringify(jsonVal))
            return;
        }

        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'MarkIndividualAttendance',
            StudId: parseInt($scope.StudID),
            Subjectid: JSON.stringify($scope.specialAttendance),
            TeacherId: parseInt(localStorage.getItem('TeacherId'))
        }

        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/AddAttendance'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
                $scope.showAlert('Success', 'Attendance marked successfully')
            } else {
                console.log(response.data)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });
    }

    $scope.markClasssAttendance = function (classDate, corse) {
        //var jsonVal = []

        //for (var i = 0; i < $scope.specialAttendanceClass.length; i++) {
        //    if ($scope.specialAttendanceClass[i].Percent == undefined || $scope.specialAttendance[i].Percent > 99) {
        //        jsonVal.push($scope.specialAttendanceClass[i].Studid)
        //    }
        //}

        //if (jsonVal.length > 0) {
        //    $scope.showAlert('Error', 'invalid percent enter for students ' + JSON.stringify(jsonVal))
        //    return;
        //}
        var r = confirm("Are you sure you want add attendance? Attendance cannot be subtracted once added.");
        if (r == true) {
            $ionicLoading.show({
                content: 'Loading'
            , animation: 'fade-in'
            , showBackdrop: true
            , maxWidth: 200
            , template: 'Loading..'
            , showDelay: 0
            });

            var data = {
                Flag: 'MarkClassAttendance',
                StudId: JSON.stringify($scope.specialAttendanceClass),
                TeacherId: parseInt(localStorage.getItem('TeacherId'))
            }

            console.log(data)
            //return

            $http({
                method: 'post'
                , url: 'http://yasheshbharti.com/api/AddAttendance'
                , data: data
            }).then(function successCallback(response) {
                if (response.data.length == 0) {
                    $scope.showAlert('Success', 'Attendance marked successfully')
                } else {
                    console.log(response.data)
                }
                $ionicLoading.hide();
            }, function errorCallback(response) {
                $ionicLoading.hide();

            });
        } else {
            console.log('You cancelled the transaction')
        }

        
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
            Flag: 'LoadEvent',
            Id: localStorage.getItem('TeacherId')
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/LoadEvent'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
$scope.Event=''
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

        if (event == undefined) {
            $scope.ErrorMsg = 'Invalid Entries'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        var rollno = event.rollNoMyList
        var Fromdate = document.getElementById('myListFromDate').value
        var ToDate = document.getElementById('myListToDate').value
        var EventName = event.eventName
        var FromTime = document.getElementById('myListFromTime').value
        var ToTime = document.getElementById('myListToTime').value

        if (rollno == '' || rollno == undefined || rollno == null) {
            $scope.ErrorMsg = 'Please enter student roll number'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        if (Fromdate == '' || Fromdate == undefined || Fromdate == null) {
            $scope.ErrorMsg = 'Please enter from date'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        if (ToDate == '' || ToDate == undefined || ToDate == null) {
            $scope.ErrorMsg = 'Please enter to date'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        if (FromTime == '' || FromTime == undefined || FromTime == null) {
            $scope.ErrorMsg = 'Please enter from time'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        if (ToTime == '' || ToTime == undefined || ToTime == null) {
            $scope.ErrorMsg = 'Please enter to time'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }
        if (EventName == '' || EventName == undefined || EventName == null) {
            $scope.ErrorMsg = 'Please enter event name'
            $scope.showAlert('Error', $scope.ErrorMsg)
            return;
        }


        $scope.ErrorMsg = ''

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


    $scope.checkStudents = function () {
        //$scope.user.rolesForClass = angular.copy($scope.rolesForClass);
        $scope.user.rolesForClass = $scope.rolesForClass.map(function (item) { return item.id; });
    }
    $scope.getStudentsDetailsbyEvntId = function (eventID) {
        if (eventID == 'newList') {
            return;
        }

        var data = {
            Flag: 'LoadStudentDetailByEventid',
            EventId: eventID
        }
        console.log(data)
        //return;

        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/EventDetails'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length > 0) {
                $scope.EvntStudents = response.data
                $scope.user.rolesForClass = []
                $scope.rolesForClass = []

                console.log($scope.EvntStudents)
                $ionicLoading.hide();

                for (i = 0; i < response.data.length; i++) {

                    $scope.rolesForClass[i] = {
                        rollno: response.data[i].rollno,
                        id: response.data[i].studentid
                    };
                   
                }
                
                $scope.checkStudents()
                //console.log($scope.user.rolesForClass)

                try {
                    document.getElementById('myListFromDate').value = $filter('date')(response.data[0].Fromdate, 'yyyy-MM-dd')
                    document.getElementById('myListToDate').value = $filter('date')(response.data[0].todate, 'yyyy-MM-dd')
                    document.getElementById('myListFromTime').value = response.data[0].fromtime
                    document.getElementById('myListToTime').value = response.data[0].Totime
                } catch (e) {
                    console.log(e)
                }
            } else {
                $scope.user.rolesForClass=[]
                $scope.rolesForClass=[]
                $ionicLoading.hide();
                $scope.EvntStudents = ''
            }
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });
    }

    $scope.showStudentList = function (eventId, val, eventName,item) {
        $scope.frmDate = item.Fromdate
        $scope.frmTime = item.fromtime
        $scope.toDate = item.todate
        $scope.toTime = item.totime

        $scope.EventId = eventId
        $scope.EventName = eventName
        $scope.getStudentsDetailsbyEvntId(eventId)
        $scope.AproveFlag = 'APPROVED'
        $scope.AttendFlag = 'Approve'
        $scope.modal.show()
    }

    $scope.showConfirmPopUp = function (eventId, val, eventName) {

        $scope.EventId = eventId
        $scope.EventName = eventName


        var confirmPopup = $ionicPopup.confirm({
            title: val + ' List',
            template: 'Are you sure you want ' + val + ' this list? <br> This action can not be reversed.'
            //'<a ng-repeat="item in ' + angular.element($scope.EvntStudents).serialize() + '">bgf</a>'
        });
        confirmPopup.then(function (res) {
            if (res) {
                if (val == 'Approve') {
                   // $scope.modal.show()
                    $scope.AproveFlag = 'APPROVED'
                    $scope.AttendFlag = 'Approve'
                    $scope.approveEventAttendance();
                    //$scope.getStudentsDetailsbyEvntId(eventId)
                    //$scope.approveEventAttendance('APPROVED')
                } else {
                    //$scope.modal.show()
                    $scope.AttendFlag = 'Reject'
                    $scope.AproveFlag = 'RejectEventAttendence'
                    $scope.approveEventAttendance();
                    //$scope.getStudentsDetailsbyEvntId(eventId)
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
            Flag: $scope.AproveFlag,
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
                $scope.ApprovedStatus = response.data[0].Message
                //alert(response.data[0].Column1)
                $scope.showAlert('Message', 'The list was ' + $scope.AproveFlag + ' successfully')
                $scope.loadEventAttendancetoApprove();
            }
            $ionicLoading.hide();
            $scope.modal.hide()
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
                $scope.PendingApptendance = ''
                $scope.showNolistMsg=true
            } else {
                $scope.showNolistMsg = false
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

// Controller of Note Setting Page.
appControllers.controller('noteSettingCtrl', function ($scope, NoteDB, $state, $ionicViewSwitcher, $stateParams, $ionicHistory, $mdBottomSheet, $mdDialog, $mdToast) {

    // initialForm is the first activity in the controller. 
    // It will initial all variable data and let the function works when page load.
    $scope.initialForm = function () {

        //$scope.noteLenght is is the variable for get note count.
        $scope.noteLenght = NoteDB.count();
    };// End initialForm.

    // clearAllData is for remove all notes data.
    // Parameter :  
    // $event(object) = position of control that user tap.
    $scope.clearAllData = function ($event) {

        //$mdBottomSheet.hide() use for hide bottom sheet.
        $mdBottomSheet.hide();

        //mdDialog.show use for show alert box for Confirm to remove all data.
        $mdDialog.show({
            controller: 'DialogController',
            templateUrl: 'confirm-dialog.html',
            targetEvent: $event,
            locals: {
                displayOption: {
                    title: "Confirm to remove all data?",
                    content: "All data will remove from local storage.",
                    ok: "Confirm",
                    cancel: "Close"
                }
            }
        }).then(function () {
            // For confirm button to remove all data.
            try {
                //To remove all notes data by calling NoteDB.clear() service.
                NoteDB.clear();
                $scope.initialForm();

                // Showing toast for remove data is success.
                $mdToast.show({
                    controller: 'toastController',
                    templateUrl: 'toast.html',
                    hideDelay: 400,
                    position: 'top',
                    locals: {
                        displayOption: {
                            title: "All data removed !"
                        }
                    }
                });
            }
            catch (e) {
                //Showing toast for unable to remove data.
                $mdToast.show({
                    controller: 'toastController',
                    templateUrl: 'toast.html',
                    hideDelay: 800,
                    position: 'top',
                    locals: {
                        displayOption: {
                            title: window.globalVariable.message.errorMessage
                        }
                    }
                });
            }
        }, function () {
            // For cancel button to remove all data.
        });
    }// End clearAllData.

    // navigateTo is for navigate to other page
    // by using targetPage to be the destination state.
    // Parameter :
    // stateNames = target state to go.
    // objectData = Object data will send to destination state.
    $scope.navigateTo = function (stateName, objectData) {
        if ($ionicHistory.currentStateName() != stateName) {
            $ionicHistory.nextViewOptions({
                disableAnimate: false,
                disableBack: true
            });

            //Next view animate will display in back direction
            $ionicViewSwitcher.nextDirection('back');

            $state.go(stateName, {
                isAnimated: objectData,
            });
        }
    }; // End of navigateTo.

    $scope.initialForm();
});// End of Notes Setting Page  Controller.

// Controller of Note Detail Page.
appControllers.controller('noteDetailCtrl', function ($scope, NoteDB, $stateParams, $filter, $mdBottomSheet, $mdDialog, $mdToast, $ionicHistory, $state, $http, $ionicLoading, $ionicPopup) {

    $scope.showAlert = function (title, content) {
        $ionicPopup.alert({
            title: title,
            content: content
        }).then(function (res) {

        });
    }
    $scope.ShowMaterialPopup = function (noticeId) {
        var confirmPopup = $ionicPopup.confirm({
            title: 'Notice Attachment',
            template: 'Do you want to attach file to this notice?',
            cancelText: 'No',
            okText: 'Yes'
            //'<a ng-repeat="item in ' + angular.element($scope.EvntStudents).serialize() + '">bgf</a>'
        });
        var noticeMsg=''
        confirmPopup.then(function (res) {
            if (res) {
                $state.go('app.notices')
                window.open('http://yasheshbharti.com/googledrive/index.html?reason=YWRkTm90aWNlTWF0ZXJpYWw=&noticeId=' + btoa(noticeId) + '&notiMsg=' + btoa(noticeMsg), '_system');
                $state.go('app.notices')
            } else {
                $scope.showAlert('Result', 'Notice Sent Successfully.')
                $state.go('app.notices')
                console.log('You are not sure');
            }
        });
    }



    $scope.addNotice = function (title, course) {
        console.log(title + ' ' + document.getElementById('description').value)
        if (course == 'cource') {
            $scope.showAlert('Error', 'Please select valid Course')
            return;
        }
        var data = {
            Title: title,
            CourseId: course,
            Content: document.getElementById('description').value,
            Poster: parseInt(localStorage.getItem('TeacherId')),
            Flag: 'InsertNotice'
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/InsertNotice'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {

            } else {

                $scope.ShowMaterialPopup(response.data[0].NoticeId)
                //$scope.showAlert('Result', response.data[0].Message)
                var noticeDet='New Notice '+title
                $scope.sendPushToCourse(course, noticeDet)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }

    $scope.sendPushToCourse = function (courseId,msg) {
        var data = {
            "app_id": "766561e7-879d-4194-9e4f-039f7631a7de",
            "filters": [
                { "field": "tag", "key": "course", "relation": "=", "value": courseId }
            ],
            "data": { "force-start": 1 },
            "contents": { "en": msg }
        }

        console.log(data)
        $http.defaults.headers.common['Authorization'] = 'Basic MzkxNzQ3MjYtODVhYy00Y2U1LWFhNGEtZWRmNTFmMzBjODVh'
        $http.post("https://onesignal.com/api/v1/notifications", data).success(function (rsdata, status) {
            console.log(rsdata);
        })
    }

    $scope.loadCourse = function () {
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
                console.log($scope.Course)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }

    $scope.loadCourse()

    $scope.goback = function () {

        $backView = $ionicHistory.backView();
        $backView.go();
        $scope.go = function (path) {
            $location.path(path);
        };
    }
    $scope.goback1 = function () {

        window.history.back();
    }
    $scope.groups = [];
    for (var i = 0; i < 4; i++) {
        $scope.groups[i] = {
            name: i,
            items: []
        };
        for (var j = 0; j < 3; j++) {
            $scope.groups[i].items.push(i + '-' + j);
        }
    }

    $scope.toggleGroup = function (group) {
        if ($scope.isGroupShown(group)) {
            $scope.shownGroup = null;
        } else {
            $scope.shownGroup = group;
        }
    };
    $scope.isGroupShown = function (group) {
        return $scope.shownGroup === group;
    }


    // initialForm is the first activity in the controller. 
    // It will initial all variable data and let the function works when page load.
    $scope.initialForm = function () {

        // $scope.actionDelete is the variable for allow or not allow to delete data.
        // It will allow to delete data when found data in the database.
        // $stateParams.actionDelete(bool) = status that pass from note list page.
        $scope.actionDelete = $stateParams.actionDele
        // $scope.note is the variable that store note detail data that receive form note list page.
        // Parameter :  
        // $scope.actionDelete = status that pass from note list page.
        // $stateParams.contractdetail(object) = note data that user select from note list page.
        $scope.note = $scope.getNoteData($scope.anDelete, $stateParams.noteDetail);

        // $scope.noteList is the variable that store data from NoteDB service.
        $scope.noteList = [];
    };// End initialForm.

    //getNoteData is for get note detail data.
    $scope.getNoteData = function (actionDelete, noteDetail) {
        // tempNoteData is temporary note data detail.
        var tempNoteData = {
            id: null,
            title: '',
            detail: '',
            createDate: $filter('date')(new Date(), 'MMM dd yyyy'),
        };

        // If actionDelete is true note Detail Page will show note detail that receive form note list page.
        // else it will show tempNoteData for user to add new data.
        return (actionDelete ? angular.copy(noteDetail) : tempNoteData);
    };// End getNoteData.

    // showListBottomSheet is for showing the bottom sheet.
    // Parameter :  
    // $event(object) = position of control that user tap.
    // noteForm(object) = note object that presenting on the view.
    $scope.showListBottomSheet = function ($event, noteForm) {

        $scope.disableSaveBtn = $scope.validateRequiredField(noteForm);

        $mdBottomSheet.show({
            templateUrl: 'contract-actions-template',
            targetEvent: $event,
            scope: $scope.$new(false),
        });
    };// End showing the bottom sheet.

    // validateRequiredField is for validate the required field.
    // Parameter :  
    // form(object) = note object that presenting on the view.
    $scope.validateRequiredField = function (form) {
        return !(form.noteTitle.$error.required == undefined);
    };// End validate the required field.

    // saveNote is for save note.
    // Parameter :  
    // note(object) = note object that presenting on the view.
    // $event(object) = position of control that user tap.
    $scope.saveNote = function (note, $event) {
        // $mdBottomSheet.hide() use for hide bottom sheet.
        $mdBottomSheet.hide();

        // mdDialog.show use for show alert box for Confirm to save data.
        $mdDialog.show({
            controller: 'DialogController',
            templateUrl: 'confirm-dialog.html',
            targetEvent: $event,
            locals: {
                displayOption: {
                    title: "Confirm to save data?",
                    content: "Data will save to Local Storage.",
                    ok: "Confirm",
                    cancel: "Close"
                }
            }
        }).then(function () {

            // For confirm button to save data.
            try {
                // To update data by calling  NoteDB.update($scope.note) service.
                if ($scope.actionDelete) {

                    if ($scope.note.id == null) {
                        $scope.note.id = $scope.noteList[$scope.noteList.length - 1].id;
                    }
                    NoteDB.update($scope.note);
                } // End update data. 

                    // To add new data by calling NoteDB.insert(note) service.
                else {
                    NoteDB.insert(note);
                    $scope.noteList = NoteDB.selectAll();
                    $scope.actionDelete = true;
                }// End  add new  data. 

                // Showing toast for save data is success.
                $mdToast.show({
                    controller: 'toastController',
                    templateUrl: 'toast.html',
                    hideDelay: 400,
                    position: 'top',
                    locals: {
                        displayOption: {
                            title: "Data Saved !"
                        }
                    }
                });//End showing toast.
            }
            catch (e) {
                // Showing toast for unable to save data.
                $mdToast.show({
                    controller: 'toastController',
                    templateUrl: 'toast.html',
                    hideDelay: 800,
                    position: 'top',
                    locals: {
                        displayOption: {
                            title: window.globalVariable.message.errorMessage
                        }
                    }
                });// End showing toast.
            }

        }, function () {
            // For cancel button to save data.
        });// End alert box.
    };// End save note.

    // deleteNote is for remove note.
    // Parameter :  
    // note(object) = note object that presenting on the view.
    // $event(object) = position of control that user tap.
    $scope.deleteNote = function (note, $event) {
        // $mdBottomSheet.hide() use for hide bottom sheet.
        $mdBottomSheet.hide();

        // mdDialog.show use for show alert box for Confirm to delete data.
        $mdDialog.show({
            controller: 'DialogController',
            templateUrl: 'confirm-dialog.html',
            targetEvent: $event,
            locals: {
                displayOption: {
                    title: "Confirm to remove data?",
                    content: "Data will remove from Local Storage.",
                    ok: "Confirm",
                    cancel: "Close"
                }
            }
        }).then(function () {
            // For confirm button to remove data.
            try {
                // Remove note by calling  NoteDB.delete(note) service.
                if ($scope.note.id == null) {
                    $scope.note.id = $scope.noteList[$scope.noteList.length - 1].id;
                }
                NoteDB.delete(note);
                $ionicHistory.goBack();
            }// End remove note.
            catch (e) {
                // Showing toast for unable to remove data.
                $mdToast.show({
                    controller: 'toastController',
                    templateUrl: 'toast.html',
                    hideDelay: 800,
                    position: 'top',
                    locals: {
                        displayOption: {
                            title: window.globalVariable.message.errorMessage
                        }
                    }
                });//End showing toast.
            }

        }, function () {
            // For cancel button to remove data.
        });// End alert box.
    };// End remove note.

    $scope.initialForm();
})

.filter('splitDownloadLink', function () {
    //'use strict';
    return function (link) {
        if (link == undefined)
            return ''
        else
            return link.split("|")[1]
    };
})
.filter('splitSizeLink', function () {
    //'use strict';
    return function (link) {
        if (link == undefined)
            return ''
        else
            return link.split("|")[2]
    };
})
;// End of Notes Detail Page  Controller.
