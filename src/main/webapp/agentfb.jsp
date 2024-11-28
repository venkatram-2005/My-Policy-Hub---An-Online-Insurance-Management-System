<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agent Feedback</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <script>
        const status = '<%= request.getAttribute("status") %>';
        if (status === 'success') {
            Swal.fire('Success', 'Agent added successfully!', 'success').then(() => {
                window.location.href = 'addagent.jsp'; // Redirect back to form
            });
        } else if (status === 'failure') {
            Swal.fire('Failure', 'Failed to add agent. Try again!', 'error').then(() => {
                window.history.back(); // Go back to the form
            });
        } else if (status === 'error') {
            Swal.fire('Error', 'An error occurred while processing your request.', 'error').then(() => {
                window.history.back();
            });
        }
    </script>
</body>
</html>
