<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />

<!-- Tailwind -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Tailwind config -->
<script>
  tailwind.config = {
    theme: {
      extend: {
        colors: {
          primary: '#8aaae5',
        },
      },
    },
  };
</script>

<!-- Font awesome -->
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
  integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
  crossorigin="anonymous"
  referrerpolicy="no-referrer"
/>

<!-- Font family -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
  rel="stylesheet"
/>

<!-- Global styles -->
<style>
  /*:root {
    --primary-color: #8aaae5;
    --white-color: #ffffff;
}*/

  /* Scrollbar */
  ::-webkit-scrollbar {
    border-radius: 0;
    width: 8px;
    height: 8px;
  }

  ::-webkit-scrollbar-thumb {
    border-radius: 4px;
    /*    background-color: rgba(0, 0, 0, 0.15);*/
    background-color: #8aaae5;
  }

  ::-webkit-scrollbar-track {
    border-radius: 0;
    background-color: rgba(0, 0, 0, 0);
  }

  /* Selection */
  ::selection {
    color: #fff;
    background: #8aaae5;
  }

  body {
    font-family: 'Inter', sans-serif;
  }
</style>
