<?php

//https://medium.com/@joseortizcosta/connecting-ios-app-to-mysql-database-with-swift-5-using-protocol-delegation-and-mvc-architectural-259dc32fcc4b
//Used above site for part of code

// Create connection to database

///check database name is correct
$con=mysqli_connect("localhost","root","root","BAC Alcohol");
 
// Check connection
if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

// month value sent from the client with a POST request
$AlcoholName = $con->real_escape_string($_POST['Alcohol Name']); 
$stmt = $con->prepare("SELECT * FROM BACTable WHERE AlcoholName = ?");

$stmt->bind_param("s", $AlcoholName);
$stmt->execute();
$result = $stmt->get_result();
$json_array = array();

// Prepares all the results to be encoded in a JSON
while ($row = $result->fetch_assoc())
{
    $bac_id = $row['Id'];
    $bac_type= $row['Alcohol Type'];
    $bac_name =$row['Alcohol Name'];
    $bac_fluidOunces = $row['Fluid Ounces'];
    $bac_percentage = $row['Alcohol Percentage'];
    $bac = array("Id" => $bac_id, 'Alcohol Type' => $bac_type, 'Alcohol Name' => $bac_name, 'Fluid Ounces' => $bac_fluidOunces, 'Alcohol Percentage'=> $bac_percentage);
    array_push($json_array, $bac);
}

// encodes array with results from database
echo json_encode($json_array); 
mysqli_close($con);
?>