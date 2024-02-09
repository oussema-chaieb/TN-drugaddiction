window.addEventListener("message", function (event) {
    var weed = event.data.weed;
    var coke = event.data.coke;
    var meth = event.data.meth;
    const canvas1 = document.getElementById('canvas1');
    const ctx1 = canvas1.getContext('2d');
  
    const canvas2 = document.getElementById('canvas2');
    const ctx2 = canvas2.getContext('2d');
  
    const canvas3 = document.getElementById('canvas3');
    const ctx3 = canvas3.getContext('2d');
  
    function drawFilledCircleWithIcon(canvas, ctx, percentage, icon, color, bgColor) {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
  
      if (percentage === 100) {
        canvas.style.display = 'none';
        return;
      } else {
        canvas.style.display = 'inline-block';
      }

      if (percentage < 30) {
        color = 'rgba(255, 0, 0, 0.6)';
        bgColor = 'rgba(255, 0, 0, 0.2)';
      }
  
      const endAngle = (percentage / 100) * (2 * Math.PI);
  
      // Draw the transparent circle
      ctx.beginPath();
      ctx.arc(canvas.width / 2, canvas.height / 2, canvas.width / 2, -0.5 * Math.PI, 1.5 * Math.PI);
      ctx.fillStyle = bgColor;
      ctx.fill();
  
      // Draw the filled circular sector without stroke
      ctx.beginPath();
      ctx.moveTo(canvas.width / 2, canvas.height / 2);
      ctx.arc(canvas.width / 2, canvas.height / 2, canvas.width / 2, -0.5 * Math.PI, -0.5 * Math.PI + endAngle);
      ctx.fillStyle = color;
      ctx.fill();
      ctx.strokeStyle = 'transparent';
      ctx.stroke();
  
      // Draw the icon
      const iconImage = new Image();
      iconImage.src = 'data:image/svg+xml;utf8,' + encodeURIComponent(icon);
  
      iconImage.onload = function () {
        const iconSize = 20;
        ctx.drawImage(iconImage, canvas.width / 2 - iconSize / 2, canvas.height / 2 - iconSize / 2, iconSize, iconSize);
      };
    }
    
    if (weed) {
      drawFilledCircleWithIcon(canvas2, ctx2, weed, '<svg xmlns="http://www.w3.org/2000/svg" height="16" width="20" viewBox="0 0 640 512"><path fill="white" d="M444.3 181.1c22.4 15.7 35.7 41.2 35.7 68.6V280c0 4.4 3.6 8 8 8h48c4.4 0 8-3.6 8-8v-30.3c0-43.2-21-83.4-56.3-108.1C463.9 125 448 99.3 448 70.3V8c0-4.4-3.6-8-8-8h-48c-4.4 0-8 3.6-8 8v66.4c0 43.7 24.6 81.6 60.3 106.7zM195 359C126 370.1 59.7 394.7 0 432c83.7 52.3 180.3 80 278.9 80h88.6L254.8 380.5c-14.7-17.2-37.5-25.1-59.8-21.5zM553.3 87.1c-5.7-3.8-9.3-10-9.3-16.8V8c0-4.4-3.6-8-8-8h-48c-4.4 0-8 3.6-8 8v62.3c0 22 10.2 43.4 28.6 55.4C550.8 153 576 199.5 576 249.7V280c0 4.4 3.6 8 8 8h48c4.4 0 8-3.6 8-8v-30.3c0-65.4-32.4-126.2-86.7-162.6zM360.9 352.1c-34.4 .1-86.8 .2-88.2 .2l117.8 137.4A64 64 0 0 0 439.1 512h88.5L409.6 374.4a64 64 0 0 0 -48.7-22.4zM616 352H432l118 137.7A64 64 0 0 0 598.6 512H616c13.3 0 24-10.8 24-24V376c0-13.3-10.8-24-24-24z"/></svg>', 'rgba(0, 206, 2, 0.6)', 'rgba(0, 206, 2, 0.2)');
    }
    if (meth) {
      drawFilledCircleWithIcon(canvas1, ctx1, meth, '<svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><path fill="white" d="M437.2 403.5L320 215V64h8c13.3 0 24-10.7 24-24V24c0-13.3-10.7-24-24-24H120c-13.3 0-24 10.7-24 24v16c0 13.3 10.7 24 24 24h8v151L10.8 403.5C-18.5 450.6 15.3 512 70.9 512h306.2c55.7 0 89.4-61.5 60.1-108.5zM137.9 320l48.2-77.6c3.7-5.2 5.8-11.6 5.8-18.4V64h64v160c0 6.9 2.2 13.2 5.8 18.4l48.2 77.6h-172z"/></svg>', 'rgba(9, 175, 216, 0.6)', 'rgba(9, 175, 216, 0.2)');
    }
    if (coke) {
      drawFilledCircleWithIcon(canvas3, ctx3, coke, '<svg xmlns="http://www.w3.org/2000/svg" height="16" width="18" viewBox="0 0 576 512"><path fill="white" d="M546.2 9.7c-5.6-12.5-21.6-13-28.3-1.2C486.9 62.4 431.4 96 368 96h-80C182 96 96 182 96 288c0 7 .8 13.7 1.5 20.5C161.3 262.8 253.4 224 384 224c8.8 0 16 7.2 16 16s-7.2 16-16 16C132.6 256 26 410.1 2.4 468c-6.6 16.3 1.2 34.9 17.5 41.6 16.4 6.8 35-1.1 41.8-17.3 1.5-3.6 20.9-47.9 71.9-90.6 32.4 43.9 94 85.8 174.9 77.2C465.5 467.5 576 326.7 576 154.3c0-50.2-10.8-102.2-29.8-144.6z"/></svg>', 'rgba(206, 0, 183, 0.6)','rgba(206, 0, 183, 0.2)');
    }
});
  