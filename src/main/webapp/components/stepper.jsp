<div class="w-full flex">
  <div class="flex w-[56rem] justify-between items-center mx-auto my-8">
    <c:choose>
      <c:when test="${requestScope['javax.servlet.forward.request_uri'] == '/subscription' && param.plan == null}">
        <!-- First step -->
        <div class="flex justify-center">
          <button class="w-12 h-12 rounded-full border-2 border-primary">1</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">First step</h2>
            <p>Pick a subscription plan</p>
          </div>
        </div>

        <hr class="w-16 border-primary border-2" />

        <!-- Second step -->
        <div class="flex justify-center">
          <button class="w-12 h-12 rounded-full bg-slate-100">2</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Second step</h2>
            <p>Choose how to pay</p>
          </div>
        </div>

        <hr class="w-16 border-primary border-2" />

        <!-- Final step -->
        <div class="flex justify-center">
          <button class="w-12 h-12 rounded-full bg-slate-100">3</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Final step</h2>
            <p>Payment Details</p>
          </div>
        </div>
      </c:when>

      <c:when test="${requestScope['javax.servlet.forward.request_uri'] == '/subscription' && param.plan != null}">
        <!-- First step -->
        <div class="flex justify-center">
          <button class="w-12 h-12 rounded-full bg-primary text-white"><i class="fa-solid fa-check"></i></button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">First step</h2>
            <p>Pick a subscription plan</p>
          </div>
        </div>

        <hr class="w-16 border-primary border-2" />

        <!-- Second step -->
        <div class="flex justify-center">
          <button class="w-12 h-12 rounded-full border-2 border-primary">2</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Second step</h2>
            <p>Choose how to pay</p>
          </div>
        </div>

        <hr class="w-16 border-primary border-2" />

        <!-- Final step -->
        <div class="flex justify-center">
          <button class="w-12 h-12 rounded-full bg-slate-100">3</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Final step</h2>
            <p>Payment Details</p>
          </div>
        </div>
      </c:when>

      <c:when test="${requestScope['javax.servlet.forward.request_uri'] != '/subscription'}">
        <!-- First step -->
        <div class="flex justify-center">
          <button class="w-12 h-12 rounded-full bg-primary text-white"><i class="fa-solid fa-check"></i></button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">First step</h2>
            <p>Pick a subscription plan</p>
          </div>
        </div>

        <hr class="w-16 border-primary border-2" />

        <!-- Second step -->
        <div class="flex justify-center">
          <button class="w-12 h-12 rounded-full bg-primary text-white"><i class="fa-solid fa-check"></i></button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Second step</h2>
            <p>Choose how to pay</p>
          </div>
        </div>

        <hr class="w-16 border-primary border-2" />

        <!-- Final step -->
        <div class="flex justify-center">
          <button class="w-12 h-12 rounded-full border-2 border-primary">3</button>
          <div class="ml-4">
            <h2 class="font-bold text-lg">Final step</h2>
            <p>Payment Details</p>
          </div>
        </div>
      </c:when>
    </c:choose>
  </div>
</div>
