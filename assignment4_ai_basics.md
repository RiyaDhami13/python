==============================================================
AI/ML Worksheet: Supervised Vs. Unsupervised Learning
Name: Riya Dhami
Assignment(4): Machine Learning Basics
==============================================================

-----------------------------------------------------------------------------
#Concept Explainations
 -Supervised Learning: Training a model using data that already contains answers, known as 'labels'. The algorithm analyzes these inputs and labeled outputs to learn the rules connecting them so future prediction can be accurate.
  such as: Flashcards used for studying ,where front has the question and the back has the exact correct answer.


 -Unsupervised Learning: Feeding raw data to a model without any correct answers 'labels' provided. The algorithm is completely on its own to discover hidden structure, similarities, or natural clusters within the dataset.
  such as: walking into a messy supermarket and sorting random groceries into sections based on category and looks similar.

----------------------------------------------------------------------------
#Classification and Regression
-Both are supervised methods because they use labeled data, but they predict different types of answers.
## Classification predicts a distinct category or class label (like deciding if an item is 'A' or 'B').
## Regression predicts a continuous, numerical value (like calculating an  exact metric, price, or score).



----------------------------------------------------------------------
Real-world task                                   | Learning Type | Sub-Type (If Supervised)
--------------------------------------------------+---------------+-------------------------
Predict tomorrow's temperature from weather data  | Supervised    | Regression
Group 10,000 customers into similar segments      | Unsupervised  | Not Applicable
Decide if an email is spam or not spam            | Supervised    | Classification
Predict the selling price of a used car           | Supervised    | Regression
Find unusual fraudulent card actions (no labels)  | Unsupervised  | Not Applicable
Recognize if a photo contains a cat, dog, or bird | Supervised    | Classification
Organize news articles without being told topics  | Unsupervised  | Not Applicable

-------------------------------------------------------------------------------------------------
1. Features and Label Maping
Task: Predict selling price of used car.
-Features:
 a.Mileage(Total kilometers driven.)
 b.Manufacturing year(age of car)
 c.Engine capacity(Horsepower/cc)

2.Why Unsupervised Learning can not predict house prices?
Unsuperivised learning algorithm look for clusters and pattterns; they do not use pre defined target labels.Becaus the algorithm does not have an answer key showing historical market prices, it can not map inputs to calculate an exact numeric value.

3.The Five Steps of the AI model 
  1. Data Collection
  2. Data Processing
  3. Model Training 
  4. Model Evaluation
  5. Model Deployment

  =================================================================================================================