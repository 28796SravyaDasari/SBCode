appControllers.controller('locationCtrl', function ($scope, $mdToast, $http, $ionicPopup, $ionicLoading, $filter, $ionicPopup, $cordovaGeolocation, $state, $stateParams, ionicDatePicker) {


    $scope.openDatePickerFrom = function () {
        var ipObj1 = {
            callback: function (val) {  //Mandatory
                $scope.frmDate = $filter('date')(new Date(val), "yyyy-MM-dd")
            },
            inputDate: new Date(),      //Optional
            mondayFirst: true,          //Optional
            from: new Date(localStorage.getItem('FromDate')), //Optional
            to: new Date(localStorage.getItem('ToDate')),
            //disableWeekdays: [0],       //Optional
            closeOnSelect: false,       //Optional
            templateType: 'popup'       //Optional
        };

        ionicDatePicker.openDatePicker(ipObj1);
    }


    $scope.openDatePickerTo = function () {
        var ipObj1 = {
            callback: function (val) {  //Mandatory
                $scope.toDate = $filter('date')(new Date(val), "yyyy-MM-dd")
            },
            inputDate: new Date(),      //Optional
            mondayFirst: true,          //Optional
            from: new Date(localStorage.getItem('FromDate')), //Optional
            to: new Date(localStorage.getItem('ToDate')),
            //disableWeekdays: [0],       //Optional
            closeOnSelect: false,       //Optional
            templateType: 'popup'       //Optional
        };

        ionicDatePicker.openDatePicker(ipObj1);
    }

    $scope.showAlert = function (title, content) {
        $ionicPopup.alert({
            title: title,
            content: content
        }).then(function (res) {

        });
    }

    $scope.openLink = function () {
        window.open($scope.noticeLink, '_system')
    }

    //$scope.openDriveToUploadNotice = function (id, resone) {
    //    id = btoa(id)
    //    resone = btoa(resone)
    //    window.open('http://yasheshbharti.com/googledrive/index.html?autoDefaulterId=' + id + '&reason='+resone, '_system');
    //}
    var notiMsg = '';
    $scope.openDriveToUploadNotice = function (noticeId, courseid) {
        var confirmPopup = $ionicPopup.confirm({
            title: 'Notice Attachment',
            template: 'Do you want to attach file to this notice?',
            cancelText: 'No',
            okText: 'Yes'
            //'<a ng-repeat="item in ' + angular.element($scope.EvntStudents).serialize() + '">bgf</a>'
        });
        confirmPopup.then(function (res) {
            if (res) {
                window.open('http://yasheshbharti.com/googledrive/index.html?reason=YWRkQXV0b2RlZmF1bHRlcg==&autoDefaulterId=' + btoa(noticeId) + '&courseId=' + btoa(courseid), '_system');
                $scope.showAlert('Result', 'Auto Defaulter Notice Set Successfully.')
            } else {
                alert('Your auto-defaulter trigger has been set.')
                window.location.reload()
               //$scope.showAlert('Result', 'Auto Defaulter Notice Set Successfully.')
                //$state.go('app.notices')
                console.log('You are not sure');
            }
        });
    }

    $scope.saveAutoDefaulter = function (course, cutoff, noticeDesc) {

       
        if (course == '') {
            $scope.showAlert('Error', 'Please select course')
            return;
        }
        if (noticeDesc == undefined) {
            $scope.showAlert('Error', 'Please enter notice description')
            return;
        }
        if (cutoff == undefined) {
            $scope.showAlert('Error', 'Please enter cutoff value')
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
            Flag: 'Insertschedular',
            Status: 'Active',
            Percent: cutoff,
            CourseId: course,
            Content: noticeDesc,
            AddedBy: localStorage.getItem('TeacherId'),
            Attachment:''
        }
        
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/AutoDefaulter'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {

            } else {
                //alert('Your auto-defaulter trigger has been set.')
                //window.location.reload()
                $scope.openDriveToUploadNotice(response.data[0].autoDefaulterID, course)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });


        //window.location.reload()

    }

    $scope.loadAutoDefaulter = function (course) {
        var data = {
            Flag: 'loadScheduler',
            CourseId: course,
            AddedBy: localStorage.getItem('TeacherId'),
        }

        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/AutoDefaulter'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
                $scope.noticeDesc = ''
                $scope.noticeLink = ''
                $scope.cutoff=''
            } else {
                $scope.noticeLink = response.data[0].FilePath
                $scope.noticeDesc = response.data[0].Description
                $scope.cutoff = response.data[0].Percent
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }

    $scope.getAllStudents = function () {
        $scope.loadCourses()
        $ionicLoading.show({
            content: 'Loading'
          , animation: 'fade-in'
          , showBackdrop: true
          , maxWidth: 200
          , template: 'Loading..'
          , showDelay: 0
        });
        var data = {
            Type: 'GetStudMaster',
            TeacherId: localStorage.getItem('TeacherId')
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/GetStudMasterList'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {

            } else {
                $scope.Students = response.data
                console.log($scope.Students)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
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

    $scope.getDefaulters = function (b, d) {

        if (b == '' || b == undefined || b == null) {
            $scope.showAlert('Error','Please select subject')
            return;
        }
        if (d == '' || d == undefined || d == null) {
            $scope.showAlert('Error', 'Please enter desired percentage')
            return;
        }

        if ($scope.frmDate == '' || $scope.frmDate == undefined || $scope.frmDate == null) {
            $scope.showAlert('Error', 'Please enter from date')
            return;
        }
        if ($scope.toDate == '' || $scope.toDate == undefined || $scope.toDate == null) {
            $scope.showAlert('Error', 'Please enter to date')
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
            Flag: 'Defaulter',
            FromDate: $scope.frmDate,
            ToDate: $scope.toDate,
            StudId: 1,
            SubjectId: b,
            DesiredAttendance: d
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/AttendanceStats'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
                $scope.Students = ''
            } else {
                $scope.Students = response.data
                console.log($scope.Students)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }

    $scope.loadCourses = function () {
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
                console.log(response.data)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });

    }

    $scope.showmap = function (lati, longi) {
        $state.go("app.map", {
            'Lati': lati,
            'Longi': longi
        })
    }

    $scope.getLocation = function () {
        initialize();
    }

    function initialize() {
        var myLatlng = new google.maps.LatLng($stateParams.Lati, $stateParams.Longi);
        var myOptions = {
            zoom: 12,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById("map"), myOptions);
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: "Student Location"
        });
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

})

appControllers.filter('timeFilter', function () {

    return function (time) {
        console.log(time)
        var output;
        if (time > 60 && time < 120) {
            var newTime = parseInt(time) - 60
            output = '1 Hr ' + newTime
            console.log(output)
            return output
        }
        else if (time < 0) {
            output = 0
            return output
        } else {
            return time
        }

    }

})