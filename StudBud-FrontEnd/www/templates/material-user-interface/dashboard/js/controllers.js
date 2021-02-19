// Controller of dashboard.
appControllers.controller('dashboardCtrl', function ($scope, $http, $filter, $timeout, $ionicLoading, $state, $stateParams, $ionicHistory, $mdBottomSheet, $ionicPopover, $cordovaGeolocation, $cordovaInAppBrowser, ionicDatePicker, $ionicPopup,$rootScope) {

    var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    var d = new Date();
    var dayName = days[d.getDay()];
    $scope.currTime = new Date().getHours();

    $scope.currentTime = $filter('date')(new Date(), "yyyy-MM-dd")
    $scope.currentDay = dayName

    $scope.downloadAttachment = function (link) {
        window.open(link.split("|")[0], '_system')
    }

    $scope.doLecturePlanningRefresh = function () {
        $scope.loadTeachersTimeTbl($filter('date')(new Date($scope.datetext), "MM/dd/yyyy"))
        $scope.$broadcast('scroll.refreshComplete');
        var data = { message: 'hello studbud' }
        //$scope.SendNotifToAll(data)
    }
    
    $scope.openUpdateLink=function(){
        var url=$rootScope.UpdateData.link
        window.open(url,'_system')
    }

    $scope.SendNotifToAll = function (what) {

        var data = {
            "app_id": "766561e7-879d-4194-9e4f-039f7631a7de",
            "included_segments": ["All"],
            "data": { "force-start": 1 },
            "contents": { "en": what.message }
        }
        $http.defaults.headers.common['Authorization'] = 'Basic MzkxNzQ3MjYtODVhYy00Y2U1LWFhNGEtZWRmNTFmMzBjODVh'
        $http.post("https://onesignal.com/api/v1/notifications", data).success(function (rsdata, status) {
            console.log(rsdata);
        })
    }

    $scope.Data = [
        {
            timetableid: '1'
        }, {
            timetableid: '2'
        }, {
            timetableid: '3'
        }, {
            timetableid: '4'
        },
    ]
    $scope.showAlert = function (title, content) {
        $ionicPopup.alert({
            title: title,
            content: content
        }).then(function (res) {

        });
    }

    $scope.darLike = function () {
        console.log('Delete')
    }

    $scope.showAlertHW = function (content) {
       
        $ionicPopup.alert({
            title: 'Homework',
            content: content
        }).then(function (res) {

        });
    }

    $scope.showContentAlert = function (title, content) {

        var alertPopup = $ionicPopup.alert({
            title: title
            , template: content
        });
        alertPopup.then(function (res) {
            // Custom functionality....
        });

    };

    function arr_diff(a1, a2) {
       // debugger;
        var newa=[]
        var length = a1.length
        for (i = 0; i < length; i++) {
            if (a1[i].locationid != a2[i].locationid) {
                newa.push(a2[i])
            }
        }
        getLocationDiff(newa)
    };

    function sendNotification(locDifff) {
        debugger;
        var courseId = localStorage.getItem('courseId')
        var msg = ''
        for (i = 0; i < locDifff.length; i++) {
            console.log('location is changed for sunbect ')
        }
    }

    function getLocationDiff(newa) {
        //debugger;
        var length = newa.length
        var locDiff=[]
        for (i = 0; i < length; i++) {
            for (j = 0; j < $scope.Location.length; j++) {
                if ($scope.Location[j].timetableid == newa[i].locationid) {
                    locDiff.push($scope.Location[j],newa[i])
                }
            }
        }
        sendNotification(locDiff)
    }

    

    $scope.sendPushToCourse = function (courseId, msg) {
        debugger;
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
            $http.defaults.headers.common['Authorization'] = undefined;
        })
    }

    $scope.editTable = function () {
       
        $ionicLoading.show({
            content: 'Loading.. It might take a while.'
          , animation: 'fade-in'
          , showBackdrop: true
          , maxWidth: 200
          , template: 'Loading.. It might take a while.'
          , showDelay: 0
        });

        var jsonVal = []
        for (var i = 0; i < $scope.TimeTableEdit.length; i++) {
            if ($scope.TimeTableEdit[i].sbjectId == '' || $scope.TimeTableEdit[i].sbjectId == undefined) {
                jsonVal.push($scope.TimeTableEdit[i].LectStart)
            }
        }
       // arr_diff($scope.TimeTableEdit2, $scope.TimeTableEdit)
        //console.log($scope.TimeTableEdit2)
        //console.log('-------------------------')
        //console.log($scope.TimeTableEdit)
        //return;

        //if (jsonVal.length > 0) {
        //    $scope.showAlert('Error', 'Please select Subject for below timeslots ' + JSON.stringify(jsonVal))
        //    return;
        //}

        //console.log(JSON.stringify($scope.TimeTableEdit))
        //console.log(jsonVal)
        //return;

        var data = {
            Flag: 'UpdateTimetable',
            TableData: JSON.stringify($scope.TimeTableEdit)
            //TeacherId: localStorage.getItem('TeacherId')
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/UpdateDetails'
            , data: data
        }).then(function successCallback(response) {
            //$scope.TimeTable = response.data
            //alert('TimeTable Edited Successfuly')
            //window.location.reload();
            $scope.showAlert('Success', 'TimeTable Edited Successfuly')
            $scope.loadTeachersTimeTblToEdit($filter('date')(new Date($scope.datetext), "MM/dd/yyyy"))
            $ionicLoading.hide()
            $scope.crsId = ''
            for (i = 0; i < $scope.Course.length; i++) {
                if ($scope.Course[i].name == $scope.corse) {
                    $scope.crsId = $scope.Course[i].id
                }
            }
            var msg = 'Timetable has been updated for ' + $scope.datetext+'. Check Lecture Planning for more details.'
            $scope.sendPushToCourse($scope.crsId,msg)
        }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
            $scope.showAlert('Error', JSON.stringify(response))
            $ionicLoading.hide()
        });
        //$ionicLoading.hide()

    }

    $scope.openUpdateDescPopup = function (timeTblId, desc) {
        $scope.reply = desc
        var myPopup = $ionicPopup.show({
            //template: '<input type="text" id="replyText" ng-model="reply">',
            template: '<textarea rows="4" ng-model="reply" maxlength="250"  id="replyText"></textarea>',
            title: 'Enter description..',
            scope: $scope,
            buttons: [
              { text: 'Cancel' },
              {
                  text: '<b>Save</b>',
                  type: 'button-positive',
                  onTap: function (e) {
                      var replyText = document.getElementById('replyText').value
                      if (replyText.length > 0) {
                          $scope.updateLecDesc(timeTblId, document.getElementById('replyText').value)
                      } else {
                          //alert($scope.reply)
                          return $scope.reply;
                      }
                  }
              }
            ]
        });

        myPopup.then(function (res) {
            console.log('Tapped!', res);
        });
    }

    $scope.updateLecDesc = function (timeTableId, material) {
        var data = {
            Flag: 'UpdateLectureDesc',
            TimetableId: timeTableId,
            Material: material,
        }
        $http.post("http://yasheshbharti.com/api/UpdateDetails", data).success(function (rsdata, status) {
            $scope.loadTeachersTimeTbl($filter('date')(new Date(document.getElementById('inputDate').value), "MM/dd/yyyy"))
        })
    }

    $scope.openDatePickerfrmDate = function () {
        //alert('called')
        var ipObj1 = {
            callback: function (val) {  //Mandatory
                $scope.frmDate = $filter('date')(new Date(val), "yyyy-MM-dd")
            },
            inputDate: new Date(),      //Optional
            mondayFirst: true,          //Optional
            //disableWeekdays: [0],       //Optional
            from: new Date(localStorage.getItem('FromDate')), //Optional
            to: new Date(localStorage.getItem('ToDate')),
            closeOnSelect: false,       //Optional
            templateType: 'popup'       //Optional
        };

        ionicDatePicker.openDatePicker(ipObj1);
    }

    $scope.openDatePickerEditNoticeDate = function () {
        //alert('called')
        var ipObj1 = {
            callback: function (val) {  //Mandatory
                $scope.datetext = $filter('date')(new Date(val), "EEE MMM d yyyy")
                $scope.loadTeachersTimeTbl($scope.datetext)
            },
            inputDate: new Date(),      //Optional
            mondayFirst: true,          //Optional
            //disableWeekdays: [0],       //Optional
            from: new Date(localStorage.getItem('FromDate')), //Optional
            to: new Date(localStorage.getItem('ToDate')),
            closeOnSelect: false,       //Optional
            templateType: 'popup'       //Optional
        };

        ionicDatePicker.openDatePicker(ipObj1);
    }


    $scope.openDatePickertoDate = function () {
        //alert('called')
        var ipObj1 = {
            callback: function (val) {  //Mandatory
                $scope.toDate = $filter('date')(new Date(val), "yyyy-MM-dd")
            },
            inputDate: new Date(),      //Optional
            mondayFirst: true,          //Optional
            //disableWeekdays: [0],       //Optional
            from: new Date(localStorage.getItem('FromDate')), //Optional
            to: new Date(localStorage.getItem('ToDate')),
            closeOnSelect: false,       //Optional
            templateType: 'popup'       //Optional
        };

        ionicDatePicker.openDatePicker(ipObj1);
    }

    $scope.loadStudentAttendance = function () {


        if ($scope.studCourse == undefined || $scope.studCourse == null || $scope.studCourse == '') {
            $scope.showAlert('Error', 'Please select course')
            return;
        }
        $ionicLoading.show({
            content: 'Loading.. It might take a while.'
          , animation: 'fade-in'
          , showBackdrop: true
          , maxWidth: 200
          , template: 'Loading.. It might take a while.'
          , showDelay: 0
        });

        var data = {
            Flag: 'ShowStudsAttendanceToTeacher',
            FromDate: document.getElementById('frmDate').value,
            ToDate: document.getElementById('toDate').value,
            TeacherId: localStorage.getItem('TeacherId'),
            CourseId: $scope.studCourse
        }

        $http.post("http://yasheshbharti.com/api/ViewAttendance", data).success(function (rsdata, status) {
            $ionicLoading.hide();
            $scope.AttendanceData = rsdata;
            console.log(rsdata)
        })

    }

    $scope.verifyLec = function (verify, id) {
        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'ChangeVerifiedStatus',
            VerifyStatus: verify,
            TeacherId: localStorage.getItem('TeacherId'),
            TimeTableID: id
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/LoadLectures'
            , data: data
        }).then(function successCallback(response) {
            $scope.loadTeachersTimeTbl($filter('date')(new Date(document.getElementById('inputDate').value), "MM/dd/yyyy"))
            $ionicLoading.hide();

        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }

    $scope.verifyLecHmePge = function (verify, id) {
        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'ChangeVerifiedStatus',
            VerifyStatus: verify,
            TeacherId: localStorage.getItem('TeacherId'),
            TimeTableID: id
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/LoadLectures'
            , data: data
        }).then(function successCallback(response) {
            $scope.loadTeachersTimeTbl($filter('date')(new Date(), "MM/dd/yyyy"))
            $ionicLoading.hide();

        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }

    $scope.getLocation = function () {
        var options = { timeout: 10000, enableHighAccuracy: true };
        var latLng = new google.maps.LatLng('19.102512', '72.845367');
        var mapOptions = {
            center: latLng,
            zoom: 15,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        $scope.map = new google.maps.Map(document.getElementById("map"), mapOptions);
        google.maps.event.addListenerOnce($scope.map, 'idle', function () {
            var marker = new google.maps.Marker({
                map: $scope.map,
                animation: google.maps.Animation.DROP,
                position: latLng
            });

            var infoWindow = new google.maps.InfoWindow({
                content: "Student Found"
            });

            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.open($scope.map, marker);
            });

        });
    }

    //todayslectureTeacherForEditTT

    $scope.loadTeachersTimeTblToEdit = function (date) {

        $ionicLoading.show({
            template: 'Loading timetable..',
            content: 'Loading timetable..'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: 'todayslectureTeacherForEditTT',
            Date: date,
            TeacherId: localStorage.getItem('TeacherId')
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/LoadLectures'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
                $scope.noLectureToShowEdit = true
                $scope.TimeTableEdit = ''
                $ionicLoading.hide()
            } else {
                $scope.noLectureToShowEdit = false
                $scope.TimeTableEdit = response.data
                $scope.TimeTableEdit2 = angular.copy($scope.TimeTableEdit)
                console.log(response.data)
                $ionicLoading.hide()
            }
        }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
            $ionicLoading.hide()
        });
    }

    $scope.doRefresh = function () {
        $scope.loadTeachersTimeTbl($filter('date')(new Date(), "yyyy-MM-dd"))
        $scope.loadNoticeForCurrentMonth()
        $scope.$broadcast('scroll.refreshComplete');
    }

    $scope.loadTeachersTimeTbl = function (date) {
        var data = {
            Flag: 'todayslectureTeacher',
            Date: date,
            TeacherId: localStorage.getItem('TeacherId')
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/LoadLectures'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
                $scope.noLectureToShow = true
                $scope.TimeTable = ''
            } else {
                $scope.noLectureToShow = false
                $scope.TimeTable = response.data
                console.log(response.data)
            }
        }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }


    $scope.loadSubjectsForteacher = function () {
        var data = {
            Flag: 'LoadSubjectsForTech',
            TeacherId: localStorage.getItem('TeacherId')
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/LoadSubjects'
            , data: data
        }).then(function successCallback(response) {
            $scope.SubjectName = response.data
            console.log(response.data)
        }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }


    $scope.openDatePicker = function () {
        var ipObj1 = {
            callback: function (val) {  //Mandatory
                $scope.datetext = $filter('date')(new Date(val), "yyyy-MM-dd")
                $scope.loadTeachersTimeTbl($scope.datetext)
            },
            inputDate: new Date(),      //Optional
            mondayFirst: true,          //Optional
            //disableWeekdays: [0],       //Optional
            from: new Date(localStorage.getItem('FromDate')), //Optional
            to: new Date(localStorage.getItem('ToDate')),
            closeOnSelect: false,       //Optional
            templateType: 'popup'       //Optional
        };

        ionicDatePicker.openDatePicker(ipObj1);
    }

    //http://yasheshbharti.com/api/GetCourseMaster

    $scope.loadCourseDetails = function (flag) {
        $ionicLoading.show({
            content: 'Loading'
           , animation: 'fade-in'
           , showBackdrop: true
           , maxWidth: 200
           , template: 'Loading..'
           , showDelay: 0
        });

        var data = {
            Flag: flag
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/GetCourseMaster'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {

            } else {
                if (flag == 'GetCourseMaster') {
                    $scope.Course = response.data
                    console.log(response.data)
                } else if (flag == 'Getlocationdetails') {
                    $scope.Location = response.data
                    console.log(response.data)
                }
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });

    }

    $scope.openHomeWorkUI = function (timeTableId, courseid, subject) {
        
        var notiMsg = 'You have new homework on ' + $scope.datetext + ' for ' + subject
        window.open('http://yasheshbharti.com/googledrive/index.html?timeTableId=' + btoa(timeTableId) + '&reason=dXBkYXRlSG9tZXdvcms=&courseId=' + btoa(courseid) + '&notiMsg=' + btoa(notiMsg), '_system');
    }

    $scope.openDriveUI = function (timetableId, courseid,subject) {
        //location.href = 'http://yasheshbharti.com/googledrive/index.html?timeTableId=' + timetableId
        var notiMsg = 'New material was added to ' + subject + ' on ' + $scope.datetext
        //updateMaterialToTimetable=dXBkYXRlTWF0ZXJpYWxUb1RpbWV0YWJsZQ==
        window.open('http://yasheshbharti.com/googledrive/index.html?timeTableId=' + btoa(timetableId) + '&reason=dXBkYXRlTWF0ZXJpYWxUb1RpbWV0YWJsZQ==&courseId=' + btoa(courseid) + '&notiMsg=' + btoa(notiMsg), '_system');
        return;
        var inAppBrowserRef = undefined;
        showHelp();

        function showHelp() {
            var target = "_self";
            var options = "location=no,hidden=yes,zoom=no";
            var url = 'http://yasheshbharti.com/googledrive/index.html?timeTableId=' + timetableId
            alert(url)
            inAppBrowserRef = cordova.InAppBrowser.open(url, target, options);

            with (inAppBrowserRef) {

                addEventListener('loadstart', loadStartCallBack);

                addEventListener('loadstop', loadStopCallBack);

                addEventListener('loaderror', loadErrorCallBack);
            }
        }

        function loadStartCallBack() {
            console.log('loading Please wait')
        }

        function loadStopCallBack() {
            if (inAppBrowserRef != undefined) {
                inAppBrowserRef.insertCSS({
                    code: "body{font-size: 25px;"
                });
                console.log('loadStopCallback')
                inAppBrowserRef.show();
            }
        }

        function loadErrorCallBack(params) {
            console.log('Error Callback')
            var scriptErrorMesssage =
                "alert('Sorry we cannot open that page. Message from the server is : " + params.message + "');"
            inAppBrowserRef.executeScript({
                code: scriptErrorMesssage
            }, executeScriptCallBack);

            inAppBrowserRef.close();
            inAppBrowserRef = undefined;
        }

        function executeScriptCallBack(params) {

            if (params[0] == null) {
                alert("Sorry we couldn't open that page. Message from the server is : '" + params.message + "'");
            }

        }
    }

    $scope.loadTeachersTimeTbl($filter('date')(new Date(), "MM/dd/yyyy"))

    $scope.loadTeachersTimeTblToEdit($filter('date')(new Date(), "MM/dd/yyyy"))

    $scope.loadNoticeForCurrentMonth = function () {

        $ionicLoading.show({
            content: 'Loading'
             , animation: 'fade-in'
             , showBackdrop: true
             , maxWidth: 200
             , template: 'Loading..'
             , showDelay: 0
        });
        var data = {

            Flag: 'LoadNoticeAtTech',
            TeacherId: localStorage.getItem('TeacherId'),
            Date: $filter('date')(new Date(), "MM/dd/yyyy")
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/NoticeDetails'
            , data: data
        }).then(function successCallback(response) {
            $scope.Notice = response.data
            console.log($scope.Notice)
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }

    $scope.memorylabels = ["Free", "Utilized"];
    $scope.memorydata = [120, 180];
    $scope.memorycolors = ['#329932', '#c13232'];
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

    $scope.loadGraph = function () {
        $ionicLoading.show({
            content: 'Loading'
            , animation: 'fade-in'
            , showBackdrop: true
            , maxWidth: 200
            , template: 'Loading..'
            , showDelay: 0
        });

        var d = new Date();
        var newd = d.setDate(d.getDate() + 30);

        var data = {
            Flag: 'ShowTeacherLectureCount',
            TeacherId: localStorage.getItem('TeacherId'),
            Fromdate: $filter('date')(new Date(), "MM/dd/yyyy"),
            ToDate: $filter('date')(newd, "MM/dd/yyyy")
        }

        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/ShowLectureCount'
            , data: data
        }).then(function successCallback(response) {
            $scope.GraphDetails = response.data;
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
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

    $scope.showmap = function () {

        $state.go('app.map');
    }

    $scope.gocloud = function () {
        window.open('http://yasheshbharti.com/googledrive/index.html', '_system')
        $scope.popover.hide();
        //$state.go('app.cloud');
    }
    $scope.gosyllabus = function () {
        $scope.popover.hide();
        $state.go('app.syllabus');
    }
    $scope.goacademic = function () {
        $scope.popover.hide();
        $state.go('app.academic');
    }
    $scope.goedittime = function () {
        $scope.popover.hide();
        $state.go('app.edittimetable');
    }
    $scope.closepops = function () {
        $scope.popover.hide();

    }
    $ionicPopover.fromTemplateUrl('templates/popover-lec.html', {
        scope: $scope,
    }).then(function (popover) {
        $scope.popover = popover;
    });

    var d = new Date();
    $scope.datetext = d.toDateString();

    $scope.addaday = function () {
        var newd = d.setDate(d.getDate() + 1);
        $scope.loadTeachersTimeTbl($filter('date')(new Date(newd), "MM/dd/yyyy"))
        $scope.datetext = new Date(newd).toDateString();
    }
    $scope.subaday = function () {

        var newd = d.setDate(d.getDate() - 1);

        $scope.loadTeachersTimeTbl($filter('date')(new Date(newd), "MM/dd/yyyy"))
        $scope.datetext = new Date(newd).toDateString();

    }

    $scope.deleteMaterial = function () {
        alert('dgfbdfgn')
    }
   

    $scope.getMaterial = function (materialContent, timetblId) {

        var myarray = materialContent.split(',');
        var newContent = []

        for (var i = 1; i < myarray.length; i++) {
            var fileSize = myarray[i].split('|')[2].split(' ').join('!@#$');
            var fileName = myarray[i].split('|')[1].split(' ').join('!@#$');
            console.log(fileSize)
            newContent.push('<span><i class="fa fa-download"></i> &nbsp;&nbsp;<a onClick=window.open("' + myarray[i].split('|')[0] + '","_system")>' + myarray[i].split('|')[1] + '</a> | ' + myarray[i].split('|')[2] + ' &nbsp;&nbsp;<a onClick=deleteMaterial(\'' + myarray[i].split('|')[0] + '\',\'' + fileName + '\',\'' + fileSize + '\',\'' + timetblId + '\') class="pull-right"><i class="fa fa-trash pull-right"></i> </a></span><br />');
            console.log('<a onClick=window.open("' + myarray[i].split('|')[0] + '","_system")>' + myarray[i].split('|')[1] + '</a><br />')
        }
        //newContent.push('</br>Click on file name to download ')

        $scope.showAlert('Material', newContent)
    }

   

    $scope.getHomeWork = function (materialContent, timetblId) {
        var myarray = materialContent.split(',');
        var newContent = []
        //var deleteHW = '<i class="fa fa-download pull-right"></i><a onClick=deleteMateri() class="pull-right"> Hello</a> &nbsp;&nbsp;<br />'
        //newContent.push(deleteHW)
        for (var i = 1; i < myarray.length; i++) {
            var fileSize = myarray[i].split('|')[2].split(' ').join('!@#$');
            var fileName = myarray[i].split('|')[1].split(' ').join('!@#$');
            console.log(fileSize)
            newContent.push("<i class='fa fa-download'></i> &nbsp;&nbsp;<a onClick=window.open('" + myarray[i].split("|")[0] + "','_system')>" + myarray[i].split("|")[1] + "</a> | " + myarray[i].split("|")[2] + " &nbsp;&nbsp;<a onClick=deleteMateri(\"" + myarray[i].split("|")[0] + "\",\"" + fileName + "\",\"" + fileSize + "\",\"" + timetblId + "\") class='pull-right'><i class='fa fa-trash pull-right'></i> </a><br />");
            console.log('<a onClick=window.open("' + myarray[i].split('|')[0] + '","_system")>' + myarray[i].split('|')[1] + '</a><br />')
        }
        //newContent.push('</br>Click on file name to download ')

        $scope.showAlertHW(newContent, timetblId)
    }
    $scope.loadCourse = function () {
        $scope.loadCourseDetails('GetCourseMaster');
    }

    $scope.loadLocation = function () {
        $scope.loadCourseDetails('Getlocationdetails');
    }


    $scope.cannotEditTT = false

    $scope.editLecRefresh = function () {
        $scope.loadTeachersTimeTblToEdit($filter('date')(new Date($scope.datetext), "MM/dd/yyyy"))
        $scope.$broadcast('scroll.refreshComplete')
    }

    $scope.addadayEdit = function () {
        var newd = d.setDate(d.getDate() + 1);
        var todays = new Date();
        if (newd < todays) {
            $scope.cannotEditTT = true
            $scope.datetext = new Date(newd).toDateString();
        } else {
            $scope.cannotEditTT = false

            $scope.loadTeachersTimeTblToEdit($filter('date')(new Date(newd), "MM/dd/yyyy"))
            $scope.datetext = new Date(newd).toDateString();
        }
    }
    $scope.subadayEdit = function () {
        var newd = d.setDate(d.getDate() - 1);
        $scope.datetext = new Date(newd).toDateString();
        var todays = new Date();
        if (newd < todays) {
            $scope.cannotEditTT = true
        } else {
            $scope.cannotEditTT = false
            $scope.loadTeachersTimeTblToEdit($filter('date')(new Date(newd), "MM/dd/yyyy"))
            $scope.datetext = new Date(newd).toDateString();
        }
    }


    /*$scope.labels = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
    $scope.data = [
      [5, 4, 4, 5, 6]
  
    ];*/
    $scope.labels = ["TAX", "Economics", "Company Laws"];
    $scope.data = [300, 500, 100];
    $scope.onClick = function (points, evt) {
        console.log(points, evt);
    };
    $scope.datasetOverride = [{ yAxisID: 'y-axis-1' }, { yAxisID: 'y-axis-2' }];
    $scope.options = {
        scales: {
            yAxes: [
              {
                  id: 'y-axis-1',
                  type: 'linear',
                  display: true,
                  position: 'left'
              },
              {
                  id: 'y-axis-2',
                  type: 'linear',
                  display: true,
                  position: 'right'
              }
            ]
        }
    };

    $scope.sharedProduct = function () {
        $mdBottomSheet.show({
            templateUrl: 'bottom-sheet-shared.html',
            controller: 'sharedSocialBottomSheetCtrl',
            targetEvent: 'click',
            locals: {
                product: 'Notes'
            }
        });
    };// End sharedProduct.

    /*  $scope.labels = ["Download Sales", "In-Store Sales", "Mail-Order Sales"];
    $scope.data = [300, 500, 100];*/

    //$scope.isAnimated is the variable that use for receive object data from state params.
    //For enable/disable row animation.
    $scope.isAnimated = $stateParams.isAnimated;

    // navigateTo is for navigate to other page 
    // by using targetPage to be the destination state. 
    // Parameter :  
    // stateNames = target state to go.
    $scope.navigateTo = function (stateName) {
        $timeout(function () {
            if ($ionicHistory.currentStateName() != stateName) {
                $ionicHistory.nextViewOptions({
                    disableAnimate: false,
                    disableBack: true
                });
                $state.go(stateName);
            }
        }, ($scope.isAnimated ? 300 : 0));
    }; // End of navigateTo.

    // goToSetting is for navigate to Dashboard Setting page
    $scope.goToSetting = function () {
        $state.go("app.dashboardSetting");
    };// End goToSetting.

}); // End of dashboard controller.

appControllers.controller('sharedSocialBottomSheetCtrl', function ($scope, $mdBottomSheet, $timeout, product, $mdToast, $cordovaSocialSharing) {

    // This function is the first activity in the controller. 
    // It will initial all variable data and let the function works when page load.
    $scope.initialForm = function () {

        //$scope.setCanvasImage for set canvas image to save to your mobile gallery.
        $scope.setCanvasImage(product.img);
        //$scope.isSaving is image saving status.
        $scope.isSaving = false;
    };// End initialForm.

    //setCanvasImage for set canvas image to save to your mobile gallery.
    $scope.setCanvasImage = function (imgPath) {
        // create canvas image.
        var canvas = document.getElementById('imgCanvas');
        var context = canvas.getContext('2d');
        var imageObj = new Image();

        imageObj.onload = function () {
            canvas.height = this.height;
            canvas.width = this.width;
            context.drawImage(imageObj, 0, 0);
        };
        //image path.
        imageObj.src = imgPath;

        return canvas.toDataURL();
    };// End setCanvasImage.

    // getCanvasImageUrl for get canvas image path.
    $scope.getCanvasImageUrl = function () {
        var canvas = document.getElementById('imgCanvas');
        return canvas.toDataURL();
    };// End getCanvasImageUrl.

    // sharedFacebook for share product picture to facebook by calling $cordovaSocialSharing.
    $scope.sharedFacebook = function () {
        $cordovaSocialSharing.shareViaFacebook(" ", $scope.getCanvasImageUrl());
        $mdBottomSheet.hide();
    }// End sharedFacebook.

    // sharedTwitter for share product picture to twitter by calling $cordovaSocialSharing.
    $scope.sharedTwitter = function () {
        $cordovaSocialSharing.shareViaTwitter(" ", $scope.getCanvasImageUrl());
        $mdBottomSheet.hide();
    }// End sharedTwitter.

    // sharedMail for share product picture to email by calling $cordovaSocialSharing.
    $scope.sharedMail = function () {
        $cordovaSocialSharing.shareViaEmail(" ", "Shopping with ionic meterial", "ionicmaterialdesign@gmail.com", "cc@IonicMeterial.com", "bcc@IonicMeterial.com", $scope.getCanvasImageUrl());
        $mdBottomSheet.hide();
    }// End sharedMail.

    // saveImage for save product picture to mobile gallery.
    $scope.saveImage = function () {

        if ($scope.isSaving == false) {
            try {
                // calling canvas2ImagePlugin to save image to gallery.
                window.canvas2ImagePlugin.saveImageDataToLibrary(
                    function (msg) {

                    },
                    function (err) {
                        throw err;
                    },
                    document.getElementById('imgCanvas'));
                $scope.isSaving = true;

                // show Image Saved ! toast when save image success.
                $mdToast.show({
                    controller: 'toastController',
                    templateUrl: 'toast.html',
                    hideDelay: 800,
                    position: 'top',
                    locals: {
                        displayOption: {
                            title: "Image Saved !"
                        }
                    }
                });
            }
            catch (e) {
                console.log(e);
                // show Save Failed : Please try again! toast when save image  is error.
                $mdToast.show({
                    controller: 'toastController',
                    templateUrl: 'toast.html',
                    hideDelay: 800,
                    position: 'top',
                    locals: {
                        displayOption: {
                            title: "Save Failed : Please try again!"
                        }
                    }
                });
            }
        }
        // Hide bottom sheet.
        $timeout(function () {
            $mdBottomSheet.hide();
        }, 1800);
    }// End saveImage.

    // sharedMore for hide bottom sheet.
    $scope.sharedMore = function () {

        $mdBottomSheet.hide();
    }// End sharedMore.

    $scope.initialForm();
});// End of share social bottom sheet controller.
// Controller of Dashboard Setting.
appControllers.controller('dashboardSettingCtrl', function ($scope, $state, $ionicHistory, $ionicViewSwitcher) {

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
}); // End of Dashboard Setting controller.

appControllers.filter('currentLecFilter', function () {

    return function (time) {
        try {
            console.log(time)
            return parseInt(time.substring(0, 2))//>new Date().getHours();
        } catch (e) {
            return time
        }
    }

})