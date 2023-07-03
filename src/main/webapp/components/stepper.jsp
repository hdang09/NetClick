<div class="w-full flex">
  <div class="flex w-[56rem] justify-between items-center mx-auto flex-col md:flex-row">
    <c:choose>
      <c:when test="${requestScope['javax.servlet.forward.request_uri'] == '/subscription' && param.plan == null}">
        <!-- First step -->
        <div class="flex justify-start md:justify-center w-72 my-3 md:my-6">
          <button class="w-12 h-12 font-semibold text-lg rounded-full border-2 border-primary">1</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">First step</h2>
            <p>Pick a subscription plan</p>
          </div>
        </div>

        <hr class="hidden md:block w-16 border-primary border-2" />

        <!-- Second step -->
        <div class="flex justify-start md:justify-center w-72 my-3 md:my-6">
          <button class="w-12 h-12 font-semibold text-lg rounded-full bg-slate-100 text-black">2</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Second step</h2>
            <p>Choose how to pay</p>
          </div>
        </div>

        <hr class="hidden md:block w-16 border-primary border-2" />

        <!-- Final step -->
        <div class="flex justify-start md:justify-center w-72 my-3 md:my-6">
          <button class="w-12 h-12 font-semibold text-lg rounded-full bg-slate-100 text-black">3</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Final step</h2>
            <p>Payment Details</p>
          </div>
        </div>
      </c:when>

      <c:when test="${requestScope['javax.servlet.forward.request_uri'] == '/subscription' && param.plan != null}">
        <!-- First step -->
        <div class="flex justify-start md:justify-center w-72 my-3 md:my-6">
          <button class="w-12 h-12 font-semibold text-lg rounded-full bg-primary text-white">
            <i class="fa-solid fa-check"></i>
          </button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">First step</h2>
            <p>Pick a subscription plan</p>
          </div>
        </div>

        <hr class="hidden md:block w-16 border-primary border-2" />

        <!-- Second step -->
        <div class="flex justify-start md:justify-center w-72 my-3 md:my-6">
          <button class="w-12 h-12 font-semibold text-lg rounded-full border-2 border-primary">2</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Second step</h2>
            <p>Choose how to pay</p>
          </div>
        </div>

        <hr class="hidden md:block w-16 border-primary border-2" />

        <!-- Final step -->
        <div class="flex justify-start md:justify-center w-72 my-3 md:my-6">
          <button class="w-12 h-12 font-semibold text-lg rounded-full bg-slate-100 text-black">3</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Final step</h2>
            <p>Payment Details</p>
          </div>
        </div>
      </c:when>

      <c:when test="${requestScope['javax.servlet.forward.request_uri'] != '/subscription'}">
        <!-- First step -->
        <div class="flex justify-start md:justify-center w-72 my-3 md:my-6">
          <button class="w-12 h-12 font-semibold text-lg rounded-full bg-primary text-white">
            <i class="fa-solid fa-check"></i>
          </button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">First step</h2>
            <p>Pick a subscription plan</p>
          </div>
        </div>

        <hr class="hidden md:block w-16 border-primary border-2" />

        <!-- Second step -->
        <div class="flex justify-start md:justify-center w-72 my-3 md:my-6">
          <button class="w-12 h-12 font-semibold text-lg rounded-full bg-primary text-white">
            <i class="fa-solid fa-check"></i>
          </button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Second step</h2>
            <p>Choose how to pay</p>
          </div>
        </div>

        <hr class="hidden md:block w-16 border-primary border-2" />

        <!-- Final step -->
        <div class="flex justify-start md:justify-center w-72 my-3 md:my-6">
          <button class="w-12 h-12 font-semibold text-lg rounded-full border-2 border-primary">3</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Final step</h2>
            <p>Payment Details</p>
          </div>
        </div>
      </c:when>
    </c:choose>
  </div>
</div>
