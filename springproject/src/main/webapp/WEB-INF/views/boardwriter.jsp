<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    #container {
        width: 1000px;
        margin: 20px auto;
    }
    .ck-editor__editable[role="textbox"] {
        /* 편집 영역 */
        min-height: 200px;
    }
    .ck-content .image {
        /* 블록 이미지 */
        max-width: 80%;
        margin: 20px auto;
    }
</style>
<div id="container">
    <div id="editor">
    </div>
</div>
<!--
    "super-build"로 제공되는 CKEditor 5는 많은 플러그인과 다양한 에디터 유형을 포함하고 있습니다.
    자세한 내용은 https://ckeditor.com/docs/ckeditor5/latest/installation/getting-started/quick-start.html#running-a-full-featured-editor-from-cdn를 참조하세요.
-->
<script src="https://cdn.ckeditor.com/ckeditor5/38.1.1/super-build/ckeditor.js"></script>
<!--
    스페인어 번역을 로드하려면 주석 해제
    <script src="https://cdn.ckeditor.com/ckeditor5/38.1.1/super-build/translations/es.js"></script>
-->
<script>
    // 이 샘플은 아직 CKEditor 5의 모든 기능을 보여주지는 않습니다.
    // 모든 기능을 찾아보려면 https://ckeditor.com/docs/ckeditor5/latest/features/index.html를 방문하세요.
    CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
        // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
        toolbar: {
            items: [
                'exportPDF','exportWord', '|',
                'findAndReplace', 'selectAll', '|',
                'heading', '|',
                'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                'bulletedList', 'numberedList', 'todoList', '|',
                'outdent', 'indent', '|',
                'undo', 'redo',
                '-',
                'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                'alignment', '|',
                'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                'textPartLanguage', '|',
                'sourceEditing'
            ],
            shouldNotGroupWhenFull: true
        },
        // 인터페이스의 언어를 변경하려면 <script> 태그를 사용하여 언어 파일을 로드해야 합니다.
        // language: 'es',
        list: {
            properties: {
                styles: true,
                startIndex: true,
                reversed: true
            }
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
        heading: {
            options: [
                { model: 'paragraph', title: '본문', class: 'ck-heading_paragraph' },
                { model: 'heading1', view: 'h1', title: '제목 1', class: 'ck-heading_heading1' },
                { model: 'heading2', view: 'h2', title: '제목 2', class: 'ck-heading_heading2' },
                { model: 'heading3', view: 'h3', title: '제목 3', class: 'ck-heading_heading3' },
                { model: 'heading4', view: 'h4', title: '제목 4', class: 'ck-heading_heading4' },
                { model: 'heading5', view: 'h5', title: '제목 5', class: 'ck-heading_heading5' },
                { model: 'heading6', view: 'h6', title: '제목 6', class: 'ck-heading_heading6' }
            ]
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
        placeholder: 'CKEditor 5에 오신 것을 환영합니다!',
        // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
        fontFamily: {
            options: [
                '기본',
                'Arial, Helvetica, sans-serif',
                'Courier New, Courier, monospace',
                'Georgia, serif',
                'Lucida Sans Unicode, Lucida Grande, sans-serif',
                'Tahoma, Geneva, sans-serif',
                'Times New Roman, Times, serif',
                'Trebuchet MS, Helvetica, sans-serif',
                'Verdana, Geneva, sans-serif'
            ],
            supportAllValues: true
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
        fontSize: {
            options: [ 10, 12, 14, '기본', 18, 20, 22 ],
            supportAllValues: true
        },
        // 아래 설정에 대해서는 주의해야 합니다. 이 설정은 CKEditor가 모든 HTML 마크업을 허용하도록 지시합니다.
        // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
        htmlSupport: {
            allow: [
                {
                    name: /.*/,
                    attributes: true,
                    classes: true,
                    styles: true
                }
            ]
        },
        // 미리보기 활성화에 주의해야 합니다.
        // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
        htmlEmbed: {
            showPreviews: true
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
        link: {
            decorators: {
                addTargetToExternalLinks: true,
                defaultProtocol: 'https://',
                toggleDownloadable: {
                    mode: 'manual',
                    label: 'Downloadable',
                    attributes: {
                        download: 'file'
                    }
                }
            }
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
        mention: {
            feeds: [
                {
                    marker: '@',
                    feed: [
                        '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                        '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                        '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                        '@sugar', '@sweet', '@topping', '@wafer'
                    ],
                    minimumCharacters: 1
                }
            ]
        },
        // "super-build"에는 추가 구성이 필요한 더 많은 프리미엄 기능이 포함되어 있으며, 아래에서 비활성화됩니다.
        // 제대로 구성하고 에디터를 설정하는 방법을 알지 않는 이상 활성화하지 마십시오.
        removePlugins: [
            // 다음 두 가지는 상용 제품이지만 체험판에 등록하지 않고도 시도해 볼 수 있습니다.
            // 'ExportPdf',
            // 'ExportWord',
            'CKBox',
            'CKFinder',
            'EasyImage',
            // 이 샘플은 Base64UploadAdapter를 사용하여 이미지 업로드를 처리하기 때문에 추가 구성이 필요하지 않습니다.
            // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
            // 이미지를 Base64로 저장하는 것은 일반적으로 좋은 방법이 아닙니다.
            // 실제 웹 사이트에서는 다른 솔루션으로 대체하십시오.
            // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
            // 'Base64UploadAdapter',
            'RealTimeCollaborativeComments',
            'RealTimeCollaborativeTrackChanges',
            'RealTimeCollaborativeRevisionHistory',
            'PresenceList',
            'Comments',
            'TrackChanges',
            'TrackChangesData',
            'RevisionHistory',
            'Pagination',
            'WProofreader',
            // MathType 플러그인에 주의하세요. MathType를 활성화하면 로컬 파일 시스템 (file://)에서 이 샘플을 로드할 때 CKEditor가 로드되지 않을 수 있습니다.
            // MathType를 사용하려면 HTTP 서버를 통해 이 사이트를 로드하세요.
            // 'MathType',
            // 다음 기능은 생산성 팩(Productivity Pack)의 일부이며 추가 라이선스가 필요합니다.
            'SlashCommand',
            'Template',
            'DocumentOutline',
            'FormatPainter',
            'TableOfContents'
        ]
    });
</script>
