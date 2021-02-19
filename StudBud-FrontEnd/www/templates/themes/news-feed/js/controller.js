// Controller of menu dashboard page.
appControllers.controller('teacherNoticeCtrl', function ($scope, $mdToast, $http, $ionicPopup, $ionicLoading, $filter, ionicDatePicker) {
    //$("#noticedate").datepicker();
    // $scope.month = $filter('date')(new Date(), "yyyy-MM-dd")


    $scope.deleteNotice = function (id) {
        $ionicLoading.show({
            content: 'Loading'
               , animation: 'fade-in'
               , showBackdrop: true
               , maxWidth: 200
               , template: 'Loading..'
               , showDelay: 0
        });

        var data = {
            Flag: 'DeleteNotices',
            NoticeId:id
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/NoticesDetails'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {

            } else {
                alert(response.data[0].Message)
                console.log(response.data)
                $scope.loadNoticeForCurrentMonth($scope.month)
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();

        });
    }

    $scope.doRefresh = function () {
        $scope.loadNoticeForCurrentMonth($scope.month)
        $scope.$broadcast('scroll.refreshComplete');
    }

    var mon = new Date().getMonth() + 1
    if (mon == 1)
        $scope.jan = true
    if (mon == 2)
        $scope.feb = true
    if (mon == 3)
        $scope.mar = true
    if (mon == 4)
        $scope.apr = true
    if (mon == 5)
        $scope.may = true
    if (mon == 6)
        $scope.jun = true
    if (mon == 7)
        $scope.jul = true
    if (mon == 8)
        $scope.aug = true
    if (mon == 9)
        $scope.sep = true
    if (mon == 10)
        $scope.act = true
    if (mon == 11)
        $scope.nov = true
    if (mon == 12)
        $scope.dec = true

    $scope.downloadAttachment = function (link) {
        window.open(link.split("|")[0], '_system')
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

    $scope.openDatePicker = function () {
        var ipObj1 = {
            callback: function (val) {  //Mandatory
                $scope.datetext = $filter('date')(new Date(val), "yyyy-MM-dd")
                $scope.loadNoticeForCurrentMonth($scope.datetext)
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

    $scope.loadNoticeForCurrentMonth = function (month) {
        
        //var monthNew = month == undefined ? $scope.month : month
        if (month == '') return
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
            Date: month//document.getElementById('noticedate').value
        }
        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/NoticeDetails'
            , data: data
        }).then(function successCallback(response) {
            if (response.data.length == 0) {
                $scope.noNoticesToShow = true
                $scope.Notice = ''
            } else {
                $scope.Notice = response.data
                console.log($scope.Notice)
                $scope.noNoticesToShow = false
            }
            $ionicLoading.hide();
        }, function errorCallback(response) {
            $ionicLoading.hide();
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    }

    $scope.loadNoticeForCurrentMonth($filter('date')(new Date(), "yyyy-MM-dd"))

    $scope.showContentAlert = function (title, content) {
        if (content.length > 250) {
            var alertPopup = $ionicPopup.alert({
                title: title
                , template: content
            });
            alertPopup.then(function (res) {
                // Custom functionality....
            });
        }
    };
}).filter('limitTextContent', function () {
    //'use strict';
    return function (content) {
        // alert(content.length)
        if (content.length > 250) return content.substring(1, 250) + '...'
        else return content
    };
});