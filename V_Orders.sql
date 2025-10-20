CREATE OR REPLACE VIEW V_Orders AS
SELECT O.CreationDate AS OrderDate,
  CONCAT(S.FirstName, ' ', S.LastName) AS Salesperson,
  COUNT(1) AS Amount_of_Orders,
  SUM(TotalDue) AS Total_Due
FROM Orders O
  join Salesperson S ON(O.SalespersonID = S.SalespersonID)
GROUP BY O.CreationDate,
  concat(S.FirstName, ' ', S.LastName)