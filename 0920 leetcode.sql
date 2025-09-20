# leetcode
# 181. Employees Earning More Than Their Managers - Easy

SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
  ON e.managerId = m.id
WHERE e.salary > m.salary;

#194. Department Highest Salary - Med

SELECT d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary
FROM Employee e
JOIN Department d
  ON e.departmentId = d.id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE departmentId = e.departmentId
);

# 602. Friend Request 2: Who Has the Most Friend

WITH all_edges AS (
  SELECT requester_id AS id FROM RequestAccepted
  UNION ALL
  SELECT accepter_id  AS id FROM RequestAccepted
),
cnt AS (
  SELECT id, COUNT(*) AS num
  FROM all_edges
  GROUP BY id
),
mx AS (
  SELECT MAX(num) AS m FROM cnt
)
SELECT id, num
FROM cnt
WHERE num = (SELECT m FROM mx);