<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - MedWorld Pharmacy</title>
    <style>
        /* Add your custom CSS here */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background: #5aa8c4;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }

        .container {
            max-width: 960px;
            margin: auto;
            padding: 20px;
        }

        .description {
            text-align: justify;
            margin-bottom: 20px;
        }

        .image-section {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
        }

        .image-section img {
            width: 50%;
            margin-right: 20px;
        }

        .image-section .text {
            width: 50%;
        }

        .image-section h2 {
            color: #5aa8c4;
        }

        .image-section p {
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<%@include file="All_Component/allcss.jsp"%>
<%@include file="All_Component/navbar.jsp"%>

    
       <h2
					class="text-center text-4xl text-black-900  pt-2 font-display font-semibold lg:text-left xl:text-5xl
                    xl:text-bold">About US</h2>
  

    <div class="container">
        <div class="image-section">
            <img src="All_Component/Images/store.jpg" alt="Our Store" />
            <div class="text">
                <h2>Welcome to MedWorld Pharmacy</h2>
                <p>At MedWorld Pharmacy, we strive to provide comprehensive healthcare solutions tailored to meet the needs of our customers. Our modern and well-equipped pharmacy store is designed to offer a comfortable and convenient shopping experience.</p>
                <p>Whether you're looking for prescription medications, over-the-counter products, or personalized health advice, our team of experienced pharmacists and healthcare professionals is here to assist you every step of the way.</p>
            </div>
        </div>

        <div class="description">
            <h2>Our Commitment</h2>
            <p>At MedWorld Pharmacy, we are committed to:</p>
            <ul>
                <li>Providing high-quality medications and healthcare products</li>
                <li>Offering personalized care and expert advice</li>
                <li>Promoting health and wellness within our community</li>
                <li>Ensuring customer satisfaction and building lasting relationships</li>
            </ul>
        </div>

        <div class="image-section">
            <img src="All_Component/Images/team.jpg" alt="Our Team" />
            <div class="text">
                <h2>Meet Our Team</h2>
                <p>Our team consists of dedicated pharmacists, pharmacy technicians, and healthcare professionals who are passionate about improving the health and well-being of our customers. With their expertise and compassionate care, they strive to deliver exceptional service and support to each individual.</p>
            </div>
        </div>

        <div class="description">
            <h2>Our Services</h2>
            <p>At MedWorld Pharmacy, we offer a wide range of services to cater to your healthcare needs, including:</p>
            <ul>
                <li>Prescription dispensing and medication management</li>
                <li>Medication therapy management and consultations</li>
                <li>Immunizations and vaccinations</li>
                <li>Health screenings and wellness programs</li>
                <li>Home delivery and online prescription refills</li>
            </ul>
        </div>

        <div class="image-section">
            <img src="All_Component/Images/cum.jpg" alt="Community Outreach" />
            <div class="text">
                <h2>Community Outreach</h2>
                <p>As part of our commitment to serving the community, MedWorld Pharmacy actively participates in various outreach programs and initiatives aimed at promoting health and wellness. We collaborate with local organizations, schools, and healthcare providers to support initiatives that benefit the community.</p>
            </div>
        </div>

        <div class="description">
            <h2>Contact Us</h2>
            <p>Visit us at MedWorld Pharmacy to experience personalized care and exceptional service. Our friendly team looks forward to assisting you with all your healthcare needs.</p>
            <p>Address: 123 Main Street, Cityville</p>
            <p>Phone: (555) 123-4567</p>
            <p>Email: info@medworldpharmacy.com</p>
        </div>
    </div>
</body>

	<%@include file="All_Component/footer.jsp"%>
</html>
