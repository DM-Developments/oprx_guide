window.addEventListener('message', (event) => {
    let data = event.data;
    let element = document.getElementById("uipage");
    let containerElement = document.getElementsByClassName("container")[0];

    if (data.action == 'hideMessage') {
        element.classList.add('fade-out');
        element.addEventListener('animationend', () => {
            element.style.visibility = "hidden";
            element.classList.remove('fade-out');
        }, { once: true }); // Ensure the listener is removed after the first call
    } else if (data.action == 'showMessage') {
        element.style.visibility = "visible";
    } else if (data.action == 'stopfinalmessage') {
        containerElement.classList.add('fade-out');
        containerElement.addEventListener('animationend', () => {
            containerElement.style.visibility = "hidden";
            containerElement.classList.remove('fade-out');
        }, { once: true });
        element.style.visibility = "hidden";
        element.style.position = "none";
    } else if (data.action == 'textsend') {
        let i = 0;
        const txt = data.hello;
        const speed = 50;
        document.getElementById("messageText").innerHTML = '';

        function typeWriter() {
            if (i < txt.length) {
                document.getElementById("messageText").innerHTML += txt.charAt(i);
                i++;
                setTimeout(typeWriter, speed);
            }
        }
        typeWriter();
    } else if (data.action == 'finalMessage') {
        containerElement.style.visibility = "visible";
        element.style.position = "fixed";

        // Additional animations
        const h1 = document.querySelector('h1');
        h1.animate([
            { transform: 'translateY(-600px)', opacity: 0 },
            { transform: 'translateY(0px)', opacity: 1 }
        ], {
            duration: 1200,
            easing: 'ease-in-out',
            fill: 'forwards',
            delay: 1000
        });

        const h1Before = document.createElement('div');
        h1Before.style.position = 'absolute';
        h1Before.style.bottom = '-10px';
        h1Before.style.height = '76px';
        h1Before.style.backgroundColor = 'var(--secondary-color)';
        h1Before.style.mixBlendMode = 'screen';
        h1Before.style.width = '0%';
        h1.appendChild(h1Before);

        h1Before.animate([
            { width: '0%' },
            { width: '100%' }
        ], {
            duration: 1000,
            easing: 'ease-in-out',
            fill: 'forwards',
            delay: 2000
        });

        const overlay = document.querySelector('.overlay');
        overlay.animate([
            { transform: 'scale(.5)', opacity: 0 },
            { transform: 'scale(1)', opacity: 1 }
        ], {
            duration: 500,
            easing: 'ease-in-out',
            fill: 'forwards'
        }).onfinish = () => {
            overlay.animate([
                { transform: 'scale(1)', skewX: '20deg' }
            ], {
                duration: 1000,
                easing: 'ease-in-out',
                fill: 'forwards'
            });
        };
    }
});

document.addEventListener("DOMContentLoaded", () => {
    const container = document.querySelector('.container');
    container.style.visibility = 'hidden';
});
