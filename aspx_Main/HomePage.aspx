<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Header.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Gebuu.HomePage1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Homepage</title>
    <link href="../Styles/StyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-***" crossorigin="anonymous" />

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Slick Carousel CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    <!-- Slick Carousel JS -->
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <script>
        function updateTime() {
            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            var seconds = currentTime.getSeconds();
            var ampm = hours >= 12 ? 'p.m.' : 'a.m.';
            hours = hours % 12 || 12;
            var dateString = currentTime.toDateString();
            var timeString = hours.toString().padStart(2, '0') + ':' + minutes.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0') + ' ' + ampm;
            document.getElementById('current-time').textContent = timeString;
            document.getElementById('current-date').textContent = dateString;
        }

        setInterval(updateTime, 1000);
    </script>

    <style>
         body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    body, h1, h2, h3, p, ul, li {
        margin: 0;
        padding: 0;
    }

    .right-side {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
        transition: transform 0.2s;
        max-width: 50%;
        flex-grow: 0;
    }

    body, h1, h2, h3, p, ul, li {
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    .left-side {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }

    .box {
        width: 250px; /* fixed width for the boxes */
        flex: 1 1 250px; /* symmetry */
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 20px;
        margin-bottom: 20px;
        text-align: center;
    }

    .box a {
        text-decoration: none;
        color: #333;
    }

    .box a:hover {
        color: #e44d26;
    }

    .right-side {
        margin-top: 20px;
    }

    h2 {
        color: #e44d26;
    }

    #current-time, #current-date {
        font-size: 18px;
        color: #555;
        margin: 5px 0;
    }

    .ads {
        margin-top: 20px;
    }

    #image-gallery {
        width: 100%;
    }

    #image-gallery img {
        width: 100%;
        border-radius: 5px;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="left-side">
            <div class="box">
                <a href="../aspx_Appointment/TableAppointment.aspx">
                    <h2><i class="fas fa-calendar"></i> Appointment</h2>
                    <!-- Add your appointments content here -->
                </a>
            </div>
            <div class="box">
                <a href="../aspx_Patient/TablePatient.aspx">
                    <h2><i class="fas fa-cat"></i> Pet</h2>
                    <!-- Add your patients content here -->
                </a>
            </div>
            <div class="box">
                <a href="../aspx_Inventory/TableInventory.aspx">
                    <h2><i class="fas fa-clipboard-list"></i> Inventory</h2>
                    <!-- Add your inventory content here -->
                </a>
            </div>
            <div class="box">
                <a href="../aspx_Room/TableRoom.aspx">
                    <h2><i class="fas fa-user-circle"></i> Room</h2>
                    <!-- Add your directory content here -->
                </a>
            </div>
        </div>
        <div class="right-side">
            <div>
                <h2>Current Time</h2>
                <p id="current-time"></p>
                <p id="current-date"></p>
            </div>

            <!-- Image Gallery Container -->
        <div class="ads">
        <h2>Advertisement</h2>
        <div id="image-gallery">
            <div><img src="../Resources/promo1.jpg" alt="Promotion Image 1"></div>
            <div><img src="../Resources/promo2.jpg" alt="Promotion Image 2"></div>
            <div><img src="../Resources/promo3.jpg" alt="Promotion Image 3"></div>
            <div><img src="../Resources/promo4.jpg" alt="Promotion Image 4"></div>
            <div><img src="../Resources/promo5.jpg" alt="Promotion Image 5"></div>
            <div><img src="../Resources/promo6.jpg" alt="Promotion Image 6"></div>
            <div><img src="../Resources/promo7.jpg" alt="Promotion Image 7"></div>
            <div><img src="../Resources/promo8.jpg" alt="Promotion Image 8"></div>
            <div><img src="../Resources/promo9.jpg" alt="Promotion Image 9"></div>
            <div><img src="../Resources/promo10.jpg" alt="Promotion Image 10"></div>
            <!-- Add more images as needed -->
        </div>
        </div>
        </div>
    </div>

    <script>
        function updateTime() {
            // Your existing time update function
        }

        setInterval(updateTime, 1000);

        $(document).ready(function () {
            // Initialize Slick Carousel
            $('#image-gallery').slick({
                slidesToShow: 1,
                slidesToScroll: undefined,
                autoplay: true,
                autoplaySpeed: 5000,
                fade: true,
                infinite: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fas fa-chevron-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fas fa-chevron-right"></i></button>'
            });
        });
    </script>
</asp:Content>
