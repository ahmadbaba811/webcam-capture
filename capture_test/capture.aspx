<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="capture.aspx.cs" Inherits="capture_test.capture" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="lib/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />

</head>
<body>

    <div class="container">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Capture Image</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div id="my_camera"></div>
                            <form class="col-md-12 m-5" >
                                <input type="button" class="btn btn-sm btn-success" value="Take Snapshot" onclick="takeSnapShot()" />
                            </form>
                        </div>
                        <div class="col-md-6">
                            <div class="row col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h3>Captured Image</h3>
                                    </div>
                                    <div class="card-body">
                                        <div id="capture_result">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>


    <script src="webcamjs/webcam.js"></script>
    <script language="JavaScript">
        Webcam.set({
            width: 600,
            height: 400,
            image_format: 'jpeg',
            jpeg_quality: 90,

        });
        Webcam.attach('#my_camera')
    </script>

    <script language="JavaScript">
        function takeSnapShot() {
            Webcam.snap(function (data_uri) {
                document.getElementById('capture_result').innerHTML = '<img src="' + data_uri + '"  />';
                Webcam.upload(data_uri, function (code, text) {
                    alert('Photo captured successfully!');
                })
            })
        }
    </script>
</body>
</html>
